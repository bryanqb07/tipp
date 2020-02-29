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
    @EnvironmentObject var session: FirebaseSession
    let emojis: [String:String] = [
        "Education": "📚",
        "Relationships": "❤️",
        "Mental Health": "👨‍⚕️",
        "Sports": "⚽️",
        "Career": "👩‍💼",
        "Fashion": "👠",
        "Gaming": "🎮",
        "Coding": "💻"
    ]
    
    var body: some View {
        VStack{
            List(session.categories) { category in
                Text("\(category.name) \(self.emojis[category.name] ?? "")")
                
            }
            Spacer()
            NavigationLink(destination: Home()){
                Text("Save")
            }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
            
        }.onAppear(perform: getCategories)
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
//
//            }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Select Categories of Expertise (optional)")
    }
    
    func getCategories() {
        session.getCategories()
    }
}

struct SelectCategories_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategories()
    }
}
