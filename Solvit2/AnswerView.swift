//
//  AnswerView.swift
//  Solvit2
//
//  Created by Bryan Lynch on 2/28/20.
//  Copyright © 2020 Bryan Lynch. All rights reserved.
//

import SwiftUI

struct QuestionRow: View {
    var text: String
    var asker: String
    var category: String
    
    var body: some View {
        HStack {
            Text(asker)
            Spacer()
            Text(category)
            Spacer()
            Text(text)
        }
    }
}

struct AnswerView: View {
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        List(session.questions) { question in
            QuestionRow(text: question.text, asker: question.asker, category: question.category)
        }
        .onAppear(perform: getQuestions)
    }

    
    func getQuestions() {
        session.getQuestions()
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
