//
//  ExamListTableViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

class ExamListTableViewController : BaseTableViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Exams"
        self.registerNib("ExamList")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5; // form.questions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "ExamListIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ExamListTableViewCell
        // cell.setQuestion(form.questions[indexPath.row], index: indexPath.row)
        // cell.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let height : CGFloat = 70
        return height
    }
}
