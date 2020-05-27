//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Antonio Ramalho on 25/05/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viewTimer: UIView!
    @IBOutlet weak var labelAnswer: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    private let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60, delay: 0, options: .curveLinear, animations: {
            self.viewTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        newQuiz()
    }
    
    private func newQuiz() {
        quizManager.refreshQuiz()
        labelAnswer.text = quizManager.question
        
        for i in 0..<quizManager.option.count {
            buttons[i].setTitle(quizManager.option[i], for: .normal)
        }
    }
    
    private func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resulvViewController = segue.destination as? ResultViewController {
            resulvViewController.totalAnswer = quizManager.totalAnswer
            resulvViewController.totalCorrectAnswer = quizManager.totalCorrectAnswer
        }
    }

    @IBAction func answerAction(_ sender: UIButton) {
        
        if let safeIndex = buttons.index(of: sender) {
            quizManager.validateAnswer(index: safeIndex)
            newQuiz()
        }
    }
}
