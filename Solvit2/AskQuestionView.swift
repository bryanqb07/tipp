//
//  AskQuestionView.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/28/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI

struct AskQuestionView: View {
    @State private var question = ""
    
    var body: some View {
        VStack{
            TextField("Please ask a question", text: $question)
                .padding()
            Button("Send") {
                print("clicked")
            }
        }
    }
}

struct AskQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AskQuestionView()
    }
}
