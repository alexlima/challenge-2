//
//  Form.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
import RealmSwift

class Form : Object
{
    var name : String = ""
    var questions : Array<Question> = [Question]()
    
    // Designated initializer
    convenience init(
        name : String,
        questions : Array<Question>)
    {
        self.init()
        self.name = name
        self.questions = questions
    }
    
    func addQuestion(title : String, alternatives : Array <Alternative>, key : String)
    {
        let question = Question(title: title, alternatives: alternatives, key : key)
        question.order = questions.count
        self.questions.append(question)
    }
    
    func addQuestion(title : String, alternatives : Array <Alternative>)
    {
        self.addQuestion(title, alternatives: alternatives, key: "")
    }
    
    func answers() -> List<Answer>
    {
        let answers = List<Answer>()
        for question in questions {
            for alternative in question.alternatives {
                if (alternative.selected){
                    let answer = Answer(key: question.key, value: alternative.value)
                    answers.append(answer)
                }
            }
        }
        return answers
    }
}
