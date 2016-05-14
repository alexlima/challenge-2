//
//  ExamResultViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

class ExamResultViewController: UIViewController
{
    @IBOutlet weak var resultLabel: UILabel!
    
    var exam : Exam = Exam()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Result"
        resultLabel.text = "\(exam.result)%"
    }

    @IBAction func finishAndSAve(sender: UIButton) {
        self.dismissViewControllerAnimated(true) {}
    }
}
