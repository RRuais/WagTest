//
//  MainViewController.swift
//  Wag
//
//  Created by Rich Ruais on 3/10/18.
//  Copyright © 2018 Rich Ruais. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MainViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var userData = [User]()
    var users = [[String:User]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
    }
    
    func setupTableView() {
        // Setup Delegate and Datasource
        userTableView.delegate = self
        userTableView.dataSource = self
        // Setup View
        userTableView.layer.cornerRadius = 10
        userTableView.allowsSelection = false
        userTableView.separatorStyle = .none
    }
    
    func getData() {
        let data = UserData()
        
        data.getData(completion: { (data) -> Void in
//            print("Users \(data)")
            
            self.userData.append(contentsOf: data)
            self.userTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// TableView Methods
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userData.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = userData[indexPath.row]

        cell.iconImageView.image = UIImage(named: "placeholder")
        cell.usernameLabel.text = user.display_name
        cell.goldLabel.text = "Gold: \(String(user.badge_counts.gold))"
        cell.silverLabel.text = "Silver: \(String(user.badge_counts.silver))"
        cell.bronzelabel.text = "Bronze: \(String(user.badge_counts.bronze))"
        cell.iconImageView.image = user.image
        
        assignImage(user: user, cell: cell)
        
        return cell
        
    }
}

// Helpers
extension MainViewController {
    
    func assignImage(user: User, cell: UserTableViewCell) {
        
        let icon = user.profile_image
        let url = URL(string: icon)
        
        if user.image != nil {
            cell.iconImageView.image = user.image
        } else {
            Alamofire.request(url!).responseImage { response in
                if let image = response.result.value {
                    cell.iconImageView.image = image
                    if let index = self.userData.index(of: user) {
                        print("INDEX \(index)")
                        self.userData[index].image = image
                    } else {
                        cell.iconImageView.image = UIImage(named: "placeholder")
                    }
                    
                } else {
                    cell.iconImageView.image = UIImage(named: "placeholder")
                }
            }
        }
    }
    
}
