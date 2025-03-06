//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dwarakanatha Reddy Poreddy on 06/03/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answerOptions: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answerOptions = a
        self.correctAnswer = correctAnswer
    }
}
