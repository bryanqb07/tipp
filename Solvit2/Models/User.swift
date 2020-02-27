//
//  User.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/25/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
