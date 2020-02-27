//
//  Messages.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/14/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI

let testMessages = [
    [
        "from": "Ciwon",
        "to": "Bryan",
        "time": "Feb 01 2020",
        "content": "Let's do this."
    ],
    [
        "from": "Bryan",
        "to": "Ciwon",
        "time": "Feb 02 2020",
        "content": "What time to meet?"
    ],
    [
        "from": "Ciwon",
        "to": "Bryan",
        "time": "Feb 01 2020",
        "content": "Let's do this."
    ]
]

struct MessageRow: View {
    let message: [String:String]
    
    var body: some View {
        HStack {
            Text(message["from"]!)
            if message["from"] == "Bryan"{
                HStack{
                    Spacer()
                    Text(message["content"]!)
                }
            } else {
                HStack{
                    Text(message["content"]!)
                    Spacer()
                }
            }
        }
    }
}

struct Messages: View {
    @State private var messages: [[String:String]] = testMessages
    
    var body: some View {
        NavigationView {
            List {
                ForEach(messages, id: \.self) { message in
                    MessageRow(message: message)
                }
            }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarTitle("Messages")
        }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
