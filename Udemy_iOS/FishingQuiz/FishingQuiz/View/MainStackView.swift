//
//  MainStackView.swift
//  FishingQuiz
//
//  Created by Kwangjun Kim on 2022/05/07.
//

import Foundation
import UIKit

class MainStackView: UIStackView {
    
    let backgroundImage: UIImageView = {
        let image: UIImageView = UIImageView(
            image: UIImage(
                named: "background"
            )
        )
        
        return image
    }()
    
    var storyLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Story Label"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.minimumScaleFactor = CGFloat(17.0)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        
        return label
    }()
    
    var choice1Button: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("choice1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemPurple
        button.clipsToBounds = true
        button.layer.cornerRadius = 7

        
        return  button
    }()
    
    var choice2Button: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("choice2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemPurple
        button.clipsToBounds = true
        button.layer.cornerRadius = 7

        
        return  button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageViewLayout()
        setupChoice2Button()
        setupChoice1Button()
        setupStoryLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension MainStackView {
    
    private func setupImageViewLayout() {
        self.addArrangedSubview(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func setupChoice2Button() {
        self.addSubview(choice2Button)
        
        choice2Button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            choice2Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choice2Button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            choice2Button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupChoice1Button() {
        self.addSubview(choice1Button)
        
        choice1Button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice1Button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choice1Button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            choice1Button.bottomAnchor.constraint(equalTo: choice2Button.topAnchor, constant: -10)
        ])
    }
    
    private func setupStoryLabel() {
        self.addSubview(storyLabel)
        
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            storyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            storyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            storyLabel.bottomAnchor.constraint(equalTo: choice1Button.topAnchor, constant: -10)
        ])
    }
}
