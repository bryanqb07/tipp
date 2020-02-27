//
//  SelectCategories.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/13/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI
import Firebase


struct SelectCategories: View {
    @ObservedObject var categories = getCategoriesData()
//    let emojis: [String:String] = [
//        "Education": "📚",
//        "Relationships": "❤️",
//        "Mental Health": "👨‍⚕️",
//        "Sports": "⚽️",
//        "Career": "👩‍💼",
//        "Fashion": "👠",
//        "Gaming": "🎮",
//        "Coding": "💻"
//    ]
    
    var body: some View {
        VStack{
            List(categories.categories) { i in
                Text(i.name)
            }
        }
//            VStack{
//                List {
//                    ForEach(categories, id: self.id) { category in
//                        VStack {
//                            Spacer()
//                            Button(action: {
//                                if self.selectedCategories[category] != nil && self.selectedCategories[category] == true {
//                                    self.selectedCategories[category] = false
//                                }
//                                else {
//                                    self.selectedCategories[category] = true
//                                }
//                            }){
//                                HStack {
////                                    Text("\(category) \(self.emojis[category])")
//                                    Spacer()
//                                }
//                            }
//                            Spacer()
//                        }
//                            .padding()
//                            .background(self.selectedCategories[category] == nil || self.selectedCategories[category] == false ? Color.white : Color.blue)
//                    }
//
//                }
//                Spacer()
//                NavigationLink(destination: Home()){
//                    Text("Save")
//                }
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 300, height: 50)
//                    .background(Color.green)
//                    .cornerRadius(15.0)
//
//            }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Select Categories of Expertise (optional)")
    }
    
//    init(){
//        ref = Database.database().reference()
//        self.ref.child("categories").observeSingleEvent(of: .value, with: { (snapshot) in
//          // Get user value
//            let value = snapshot.value as? NSDictionary
//            if let name = value?["name"] as? String {
//                self.categories.append(name)
//            }
//          // ...
//          }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
}

class getCategoriesData: ObservableObject {
    @Published var categories = [category]()

    init(){
        let db = Firestore.firestore()

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
}


struct SelectCategories_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategories()
    }
}
