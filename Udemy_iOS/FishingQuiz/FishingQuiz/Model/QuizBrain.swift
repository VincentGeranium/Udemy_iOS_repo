//
//  QuizBrain.swift
//  FishingQuiz
//
//  Created by Kwangjun Kim on 2022/05/07.
//

import Foundation

struct QuizBrain {
    var quizNumber = 0
    
    let quizArray = [
        Quiz(
            question: "대한민국에 서식하는 배스는?",
            choice1: "큰 입 배스",
            choice2: "작은 입 배스",
            answer: "큰 입 배스"
        ),
        
        Quiz(
            question: "하드베이트 중 SP는 무엇을 뜻하는가?",
            choice1: "Special",
            choice2: "Suspend",
            answer: "Suspend"
        ),
        
        Quiz(
            question: "로드에 명시되어 있는 MH는 무었을 뜻하는가?",
            choice1: "Mega Hit",
            choice2: "Medium Heavy",
            answer: "Medium Heavy"
        ),
    ]
    
    func getQuestion() -> String {
        return quizArray[quizNumber].question
    }
    
    func getChoice1() -> String {
        return quizArray[quizNumber].choice1
    }
    
    func getChoice2() -> String {
        return quizArray[quizNumber].choice2
    }
    
    func getAnswer() -> String {
        return quizArray[quizNumber].answer
    }
    
    func nextQuestion(userChoice: String) -> Bool {
        let answer = getAnswer()
        
        if userChoice == answer {
            return true
        } else {
            return false
        }
    }
    
   mutating func countUpQuizNumber() {
        if quizNumber + 1 < quizArray.count {
            quizNumber += 1
        } else {
            quizNumber = 0
        }
    }
}
