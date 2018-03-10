//
//  GlobalExtensions.swift
//  Wag
//
//  Created by Rich Ruais on 3/10/18.
//  Copyright © 2018 Rich Ruais. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.layer.shadowRadius = 6
    }
}
