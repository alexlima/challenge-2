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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result"
    }

    @IBAction func finishAndSAve(sender: UIButton) {
        self.dismissViewControllerAnimated(true) {}
    }
}
