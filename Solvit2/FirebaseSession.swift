////
////  FirebaseSession.swift
////  Solvit2
////
////  Created by Bryan Lynch on 2/25/20.
////  Copyright © 2020 Bryan Lynch. All rights reserved.
////
//
//import Foundation
//import Firebase
//import FirebaseAuth
//
//class FirebaseSession: ObservableObject {
//
//    //MARK: Properties
//    @Published var session: User?
//    @Published var isLoggedIn: Bool?
//    @Published var categories: [Category] = []
//
//    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
//
//    //MARK: Functions
//    func listen() {
//        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
//                self.isLoggedIn = true
//                self.getCategories()
//            } else {
//                self.isLoggedIn = false
//                self.session = nil
//            }
//        }
//    }
//
//    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
//    }
//
//    func logOut() {
//            try! Auth.auth().signOut()
//            self.isLoggedIn = false
//            self.session = nil
//
//    }
//
//    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
//    }
//
//    func getCategories() {
//        self.ref.child("categories").observeSingleEvent(of: .value, with: { (snapshot) in
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                    let category = Category(snapshot: snapshot) {
//                    self.categories.append(category)
//                }
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
////
////    func uploadTODO(todo: String) {
////        //Generates number going up as time goes on, sets order of TODO's by how old they are.
////        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
////
////        let postRef = ref.child(String(number))
////        let post = TODOS(todo: todo, isComplete: "false")
////        postRef.setValue(post.toAnyObject())
////    }
////
////    func updateTODO(key: String, todo: String, isComplete: String) {
////        let update = ["todo": todo, "isComplete": isComplete]
////        let childUpdate = ["\(key)": update]
////        ref.updateChildValues(childUpdate)
////    }
//
//}
