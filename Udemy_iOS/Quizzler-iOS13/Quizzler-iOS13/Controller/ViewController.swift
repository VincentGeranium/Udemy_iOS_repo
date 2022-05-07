//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    
    var quizBrain = QuizBrain()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        choice1Button.tag = 1
        choice2Button.tag = 2
        choice3Button.tag = 3
 
        updateUI()
    }

    @IBAction func answerButtonpressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else { return }
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let buttonTitle = quizBrain.getButtonTitle()
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1Button.setTitle(buttonTitle[0], for: .normal)
        choice2Button.setTitle(buttonTitle[1], for: .normal)
        choice3Button.setTitle(buttonTitle[2], for: .normal)
        
        choice1Button.backgroundColor = .clear
        choice2Button.backgroundColor = .clear
        choice3Button.backgroundColor = .clear
    }
}

