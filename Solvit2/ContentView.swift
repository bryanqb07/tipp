//
//  ContentView.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/13/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
//    @ObservedObject var session = FirebaseSession()
    
    var body: some View {
       Register()
    }
//        VStack(alignment: .leading) {
//            ForEach(session.categories) {
//                Text("\($0.name)")
//            }
//
//            Text("Ready or not, here I come!")
//        }.onAppear {
//            self.session.getCategories()
//        }
//        NavigationView {
//            Group {
//                if session.session != nil {
//                    VStack {
//                        Text("Hello world")
//                    }
//                } else {
//                    Login()
//                    .navigationBarItems(trailing: Text(""))
//                }
//            }
//            .onAppear(perform: getUser)
//            .navigationBarTitle(Text("TODO"))
//            .padding()
//        }
}
        
    //MARK: Functions
//    func getUser() {
//        session.listen()
//    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
