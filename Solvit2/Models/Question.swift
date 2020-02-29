//
//  Question.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/28/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import Foundation

struct question: Identifiable {
    var id: String
    var text: String
    var asker: String
    var category: String
}
