//
//  Login.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/29/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15){
                Spacer()
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                
                NavigationLink(destination: Home()) {
                    Text("Login")
                }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                NavigationLink(destination: Register()){
                    Text("Sign Up")
                }
                Spacer()
            }
            .padding([.leading, .trailing], 27.5)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Login")
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
