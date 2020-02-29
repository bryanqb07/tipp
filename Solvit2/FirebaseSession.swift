////
////  FirebaseSession.swift
////  Solvit2
////
////  Created by Bryan Lynch on 2/25/20.
////  Copyright © 2020 Bryan Lynch. All rights reserved.
////

import Foundation
import Firebase
import FirebaseAuth

class FirebaseSession: ObservableObject {

    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    @Published var categories: [category] = []
    @Published var questions: [question] = []

    var db = Firestore.firestore()
    
    //MARK: Functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }

    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil

    }

    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func getCategories() {
        db.collection("categories").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            for document in querySnapshot!.documents {
                let id = document.documentID
                let name = document.get("Name") as! String

                self.categories.append(category(id: id, name: name))
                print(id)
                print(name)
            }
        }
    }
    
    func getQuestions() {
        _ = db.collection("questions").whereField("active", isEqualTo: true).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error retreiving collection: \(error)")
            }
            
            self.questions = []
            
            for document in querySnapshot!.documents {
                let id = document.documentID
                let text = document.get("text") as! String
                let asker = document.get("asker") as! String
                let category = document.get("category") as! String

                self.questions.append(question(id: id, text: text, asker: asker, category: category))
                print(id)
                print(asker)
                print(text)
            }
        }
    }
    
    func createUser(completionHandler: @escaping () -> Void) {
        let data = ["id": session?.uid, "email": session?.email]
        db.collection("users").addDocument(data: data) { err in
            if let err = err {
                print("Error creating document.")
            } else {
                print("User created")
            }
        }
    }
    
    func updateUserCategories(categories: [category]) {
            return
    }
//
//    func uploadTODO(todo: String) {
//        //Generates number going up as time goes on, sets order of TODO's by how old they are.
//        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
//
//        let postRef = ref.child(String(number))
//        let post = TODOS(todo: todo, isComplete: "false")
//        postRef.setValue(post.toAnyObject())
//    }
//
//    func updateTODO(key: String, todo: String, isComplete: String) {
//        let update = ["todo": todo, "isComplete": isComplete]
//        let childUpdate = ["\(key)": update]
//        ref.updateChildValues(childUpdate)
//    }

}
