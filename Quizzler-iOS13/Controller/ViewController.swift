//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLable: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    @IBOutlet var scoreLable: UILabel!
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle;
        let actualAnswer = quizBrain.checkAnswer(userAnswer!)
        
        if(actualAnswer){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
   
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.getProgress()
        questionLable.text = quizBrain.getQuestionText()
        scoreLable.text = "Total Score is \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor =  UIColor.clear
    }
    
}

