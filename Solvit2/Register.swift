//
//  Register.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/13/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct Register: View {
    @EnvironmentObject var session: FirebaseSession
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var errorMessage = ""
    @State var selection: Int? = nil // turn button into navlink
    
    var disableForm: Bool {
        return email.count < 5 || password.count < 6
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15){
                Spacer()
                TextField("Email Address", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                
                SecureField("Confirm Password", text: $confirmedPassword)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                
                NavigationLink(destination: SelectCategories(), tag: 1, selection: $selection) {
                    Button(action: {
                        if(self.password == self.confirmedPassword){
                            self.session.signUp(email: self.email, password: self.password) { authResult, error in
                                if let registrationError = error {
                                    print(registrationError)
                                    return
                                }
                                
                                self.session.createUser()
                                
//                                let db = Firestore.firestore()
//                                db.collection("users").document("LA").setData([
//                                    "email": self.email
//                                    ]) { err in
//                                        if let err = err {
//                                            print("Error writing document: \(err)")
//                                        } else {
//                                            self.selection = 1
//                                        }
//                                    }
                            }
                        } else {
                            self.errorMessage = "Passwords do not match."
                        }
                    }) {
                        Text("Register")
                    }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .disabled(disableForm)
                }
                Text(errorMessage)
                Spacer()
            }
            .padding([.leading, .trailing], 27.5)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Register")
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
