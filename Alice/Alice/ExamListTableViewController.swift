//
//  ExamListTableViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit
import RealmSwift

class ExamListTableViewController : BaseTableViewController, UIAlertViewDelegate
{
    var exam : Exam = Exam()
    var exams : Array<Exam> = [Exam]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Exams"
        self.registerNib("ExamList")
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.exams = realm.objects(Exam).toArray()
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return exams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "ExamListIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ExamListTableViewCell
        cell.setExam(exams[indexPath.row], index: indexPath.row)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let height : CGFloat = 70
        return height
    }
    
    @IBAction func addExam(sender: UIBarButtonItem)
    {
        let alert = UIAlertView()
        alert.title = "What is the patient name?"
        alert.addButtonWithTitle("Done")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.addButtonWithTitle("Cancel")
        alert.delegate = self
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
        let name = (alertView.textFieldAtIndex(0)?.text)!
        self.exam.patient = Patient(name: name)
        self.exam.createdAt = NSDate()
        self.performSegueWithIdentifier("ExamSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "ExamSegue")
        {
            let navigation = segue.destinationViewController
            let controller = navigation.childViewControllers[0] as! ExamTableViewController
            controller.exam = exam
        }
    }
}
