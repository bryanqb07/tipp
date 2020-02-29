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
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        NavigationView {
            Group {
                if session.session != nil {
                    VStack {
                        AnswerView()
                    }
                } else {
                    Login()
                    .navigationBarItems(trailing: Text(""))
                }
            }
            .onAppear(perform: getUser)
            .navigationBarTitle(Text("Home"))
            .padding()
        }
    }
        
        //MARK: Functions
        func getUser() {
            session.listen()
        }
    }
        




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
