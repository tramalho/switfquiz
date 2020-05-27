//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Thiago Antonio Ramalho on 25/05/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import Foundation
class Quiz {
    let question: String
    let options: [String]
    private let correctAnswer: String
    
    init(question:String, options:[String], correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    func validateAnswer(_ index:Int) -> Bool {
        return options[index] == correctAnswer
    }
}
