//
//  ExamListTableViewCell.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

class ExamListTableViewCell: UITableViewCell
{
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var examDateLabel: UILabel!
    @IBOutlet weak var examResultLabel: UILabel!
    
    func setExam(exam : Exam, index : Int)
    {
        patientNameLabel.text = exam.patient?.name
        examDateLabel.text = exam.createdAt?.stringFromDate("MM/dd/yyyy")
        examResultLabel.text = "\(exam.result)%"
    }
}
