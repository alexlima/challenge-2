//
//  ExamQuestionTableViewCell.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit
import DLRadioButton

protocol ExamQuestionTableViewCellDelegate
{
    func examQuestionDidSelectAlternative(questionOrder : Int, alternativeOrder : Int)
}

class ExamQuestionTableViewCell: UITableViewCell
{
    var delegate : ExamQuestionTableViewCellDelegate! = nil
    var questionOrder : Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButton01: DLRadioButton!
    @IBOutlet weak var radioButton02: DLRadioButton!
    
    func setQuestion(question : Question, index : Int)
    {
        // Question
        questionOrder = question.order
        titleLabel.text = "\(question.order + 1). \(question.title)"
        
        // Alternative 1
        let alternative1 : Alternative = question.alternatives[0]
        radioButton01.addTarget(self, action: Selector("selectButton:"), forControlEvents: .TouchUpInside)
        radioButton01.setTitle(alternative1.title, forState: .Normal)
        radioButton01.tag = 0
        
        // Alternative 1
        let alternative2 : Alternative = question.alternatives[1]
        radioButton02.addTarget(self, action: Selector("selectButton:"), forControlEvents: .TouchUpInside)
        radioButton02.setTitle(alternative2.title, forState: .Normal)
        radioButton02.tag = 1
        radioButton01.otherButtons = [radioButton02]
    }
    
    func selectButton(button : DLRadioButton)
    {
        self.delegate.examQuestionDidSelectAlternative(self.questionOrder, alternativeOrder: button.tag)
    }
}