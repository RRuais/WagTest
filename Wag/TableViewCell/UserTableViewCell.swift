//
//  UserTableViewCell.swift
//  Wag
//
//  Created by Rich Ruais on 3/10/18.
//  Copyright © 2018 Rich Ruais. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var placeholderImageView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var silverLabel: UILabel!
    @IBOutlet weak var bronzelabel: UILabel!
    
    var iconImageView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        // Setup Labels
        usernameLabel.layer.cornerRadius = 10
        usernameLabel.layer.masksToBounds = true
        
        // Setup ImageView
        iconImageView.frame = placeholderImageView.bounds
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width / 2
        iconImageView.clipsToBounds = true
        placeholderImageView.layer.backgroundColor = UIColor.clear.cgColor
        placeholderImageView.addShadow()
        placeholderImageView.addSubview(iconImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
