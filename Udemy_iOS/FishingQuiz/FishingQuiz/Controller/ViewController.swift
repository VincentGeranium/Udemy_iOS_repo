//
//  ViewController.swift
//  FishingQuiz
//
//  Created by Kwangjun Kim on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
    
    let mainStackView: MainStackView = MainStackView()
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        updateUI()
        setupMainStackViewLayout()
        setupButtonAction()
    }
    
    
}

private extension ViewController {
    private func setupMainStackViewLayout() {
        self.view.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setupButtonAction() {
        mainStackView.choice1Button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        mainStackView.choice2Button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        print("Tap")
        guard let userChoice = sender.currentTitle else { fatalError() }
        
        let nextQuestion = quizBrain.nextQuestion(userChoice: userChoice)
        
        if nextQuestion {
            quizBrain.countUpQuizNumber()
            sender.clipsToBounds = true
            sender.backgroundColor = .systemGreen
        } else {
            sender.clipsToBounds = true
            sender.backgroundColor = .systemRed
        }
        
        quizBrain.countUpQuizNumber()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
      
    }
    
    
    @objc func updateUI() {
        mainStackView.storyLabel.text = quizBrain.getQuestion()
        mainStackView.choice1Button.setTitle(quizBrain.getChoice1(), for: .normal)
        mainStackView.choice2Button.setTitle(quizBrain.getChoice2(), for: .normal)
        
        mainStackView.choice1Button.backgroundColor = .systemPurple
        mainStackView.choice2Button.backgroundColor = .systemPurple
    }
    
}

