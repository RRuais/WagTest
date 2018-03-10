//
//  User.swift
//  Wag
//
//  Created by Rich Ruais on 3/10/18.
//  Copyright © 2018 Rich Ruais. All rights reserved.
//

import Foundation
import Alamofire


struct User: Decodable {
    let display_name: String
    let badge_counts: Badges
    let profile_image: String
    var image: UIImage? = nil
    
    private enum CodingKeys: String, CodingKey { case display_name, badge_counts, profile_image }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        display_name = try container.decode(String.self, forKey: .display_name)
        badge_counts = try container.decode(Badges.self, forKey: .badge_counts)
        profile_image = try container.decode(String.self, forKey: .profile_image)
        image = nil
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return
            lhs.display_name == rhs.display_name && lhs.badge_counts == rhs.badge_counts && lhs.profile_image == rhs.profile_image && lhs.image == rhs.image
    }
}

struct Badges: Decodable {
    let bronze: Int
    let gold: Int
    let silver: Int
}

extension Badges: Equatable {
    static func == (lhs: Badges, rhs: Badges) -> Bool {
        return
            lhs.bronze == rhs.bronze && lhs.gold == rhs.gold && lhs.silver == rhs.silver
    }
}

class UserData {
    
    let url = URL(string: "https://api.stackexchange.com/2.2/users?site=stackoverflow")
    
    func getData(completion: @escaping (_ userData: [User]) -> Void) {
        
        Alamofire.request(url!).responseJSON { response in
            
            var returnedData = [User]()
            
            if let json = response.result.value as? [String:Any] {
                
                guard let jsonData = json["items"] as? [[String:Any]] else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let data = try JSONSerialization.data(withJSONObject: jsonData, options: JSONSerialization.WritingOptions.prettyPrinted)
                    let userData = try! decoder.decode([User].self, from: data)
                    returnedData.append(contentsOf: userData)
                } catch {
                    
                }
            }
            completion(returnedData)
        }
    }
    
}
