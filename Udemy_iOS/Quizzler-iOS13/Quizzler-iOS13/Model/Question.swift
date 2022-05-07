//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Kwangjun Kim on 2022/05/06.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Answers
    let correctAnswer: String
    
    init(q: String, a: Answers, correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}

struct Answers {
    let choice1: String
    let choice2: String
    let choice3: String
    
    init(choice1: String, choice2: String, choice3: String) {
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice3 = choice3
    }
}
