//
//  Category.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/25/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//
//
//import Foundation
//import Firebase
//
//struct categoryDataType: Identifiable {
//    var id: String
//    var name: String
//    var message: String
//}
//
//class categoryViewModel: ObservableObject {
//    @Published var messages = [categoryDataType]()
//
//    init() {
//        db.collection("users").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    self.messages.append(document)
//                }
//            }
//        }
//    }
//}
