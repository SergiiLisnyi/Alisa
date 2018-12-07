//
//  TestingViewController.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/16/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class TestingViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    // MARK: - Instance Properties
    var level: String?
    var currentTest = 0
    
    
    public var model : ModelTesting?/* {
     didSet {
     configureView()
     }
     }*/
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(currentTest)
    }
    
    
    func timer() {
        
        
        
    }
    
    
    func configureView(_ index :Int) {
        guard let model = model, isViewLoaded else { return }
        levelLabel.text = level
        questionLabel.text = model.tests[index].question
        answer0.setTitle(model.tests[index].answers[0], for: .normal)
        answer1.setTitle(model.tests[index].answers[1], for: .normal)
        answer2.setTitle(model.tests[index].answers[2], for: .normal)
        answer3.setTitle(model.tests[index].answers[3], for: .normal)
    }
    
    
    @IBAction func onButtonAnswerTapped(_ sender: UIButton) {
        let number = sender.tag
        
        let arr = [answer0, answer1, answer2, answer3]
        
        arr.forEach { (button) in
            if button?.tag == number { //change ternarn
                button?.isUserInteractionEnabled = false }
            else {
                button?.isEnabled = false
            }
        }
        
        
        
    }
    
    func resetButtons() {
        let arr = [answer0, answer1, answer2, answer3]
        arr.forEach { (button) in
            button?.isEnabled = true
            button?.isUserInteractionEnabled = true
        }
        
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        resetButtons()
        currentTest += 1 //add limit
        configureView(currentTest)
    }
    
}
