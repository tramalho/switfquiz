//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Antonio Ramalho on 25/05/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var answered: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var wrong: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    var totalAnswer = 0
    var totalCorrectAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answered.text = "Total de Perguntas: \(totalAnswer)"
        correct.text = "Total de Respostas Certas: \(totalCorrectAnswer)"
        wrong.text = "Total de Respostas Erradas: \(totalAnswer - totalCorrectAnswer)"
        
        score.text = "\(totalCorrectAnswer * 100 / totalAnswer)%"
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
