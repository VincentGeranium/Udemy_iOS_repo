//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Kwangjun Kim on 2022/05/06.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: Answers(choice1: "Heart", choice2: "Skin", choice3: "Large Intestine"), correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: Answers(choice1: "25", choice2: "50", choice3: "100"), correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: Answers(choice1: "Global Meridian Time", choice2: "Greenwich Mean Time", choice3: "General Median Time"), correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: Answers(choice1: "Chapeau", choice2: "Écharpe", choice3:  "Bonnet"), correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: Answers(choice1: "Notebook", choice2: "Handkerchief", choice3: "Watch"), correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: Answers(choice1: "Au Revoir", choice2: "Adiós", choice3: "Salir"), correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: Answers(choice1: "Green", choice2: "Orange", choice3: "Blue"), correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: Answers(choice1: "Rum", choice2: "Whisky", choice3: "Gin"), correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: Answers(choice1: "Panda", choice2: "Gorilla", choice3: "Crocodile"), correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: Answers(choice1: "Indonesia", choice2: "Australia", choice3: "Scotland"), correctAnswer: "Australia")
        
    ]
    
    var questionNumber = 0
    
    var scores = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            // User got it right
            scores += 1
            return true
        } else {
            // User got it wrong
            return false
        }
    }
    
    func getScore() -> Int {
        return scores
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getButtonTitle() -> [String] {
        var buttonTitles: [String] = []
        
        let choice1Title = quiz[questionNumber].answer.choice1
        let choice2Title = quiz[questionNumber].answer.choice2
        let choice3Title = quiz[questionNumber].answer.choice3
        
        buttonTitles.append(choice1Title)
        buttonTitles.append(choice2Title)
        buttonTitles.append(choice3Title)
        
        return buttonTitles
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            scores = 0
        }
    }
}
