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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionThreeBtn: UIButton!
    @IBOutlet weak var optionTwoBtn: UIButton!
    @IBOutlet weak var optionOneBtn: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        if(isAnswerCorrect){
            print("Correct Answer")
            sender.backgroundColor = UIColor.green
            sender.setTitleColor(UIColor.black, for: .normal)
        } else {
            print( "Incorrect Answer")
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc  func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answerOptions = quizBrain.getOptions()
        optionOneBtn.setTitle(answerOptions[0], for: .normal)
        optionTwoBtn.setTitle(answerOptions[1], for: .normal)
        optionThreeBtn.setTitle(answerOptions[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        optionOneBtn.backgroundColor = UIColor.clear
        optionTwoBtn.backgroundColor = UIColor.clear
        optionThreeBtn.backgroundColor = UIColor.clear
        optionOneBtn.setTitleColor(UIColor.white, for: .normal)
        optionTwoBtn.setTitleColor(UIColor.white, for: .normal)
        optionThreeBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
}

