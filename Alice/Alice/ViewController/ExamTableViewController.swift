//
//  ExamTableViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

protocol ExamTableViewControllerDelegate : NSObjectProtocol
{
    func examTableViewController(controller : UIViewController, didSubmitForm form : Form)
}

class ExamTableViewController : BaseTableViewController, ExamQuestionTableViewCellDelegate
{
    // var delegate : ExamTableViewControllerDelegate! = nil
    var form = Form()
    var exam : Exam = Exam()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Questions"
        self.registerNib("ExamQuestion")
        self.initQuestions()
    }
    
    func initQuestions()
    {
        form.addQuestion("Does the patient have migraines?", alternatives: [Alternative(weight : 25, title: "Yes"), Alternative(title: "No")])
        form.addQuestion("Does the patient have 15 years or less?", alternatives: [Alternative(weight : 25, title: "Yes"), Alternative(title: "No")])
        form.addQuestion("What is the patient gender?", alternatives: [Alternative(weight : 25, title: "Male"), Alternative(title: "Female")])
        form.addQuestion("Does the patient use hallucinogenic drugs?", alternatives: [Alternative(weight : 25, title: "Yes"), Alternative(title: "No")])
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return form.questions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "ExamQuestionIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ExamQuestionTableViewCell
        cell.setQuestion(form.questions[indexPath.row], index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let height : CGFloat = 160
        return height
    }
    
    func examQuestionDidSelectAlternative(questionOrder: Int, alternativeOrder: Int)
    {
        var alternatives = form.questions[questionOrder].alternatives
        for (var i = 0; i < alternatives.count; i++){
            alternatives[i].selected = false
        }
        alternatives[alternativeOrder].selected = true
    }
    
    @IBAction func cancelExam(sender: UIBarButtonItem)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveExam(sender: UIBarButtonItem)
    {
        do {
            exam.result = form.answer()
            try realm.write() {
                realm.add(exam)
            }
            print("Ok, exam saved.")
            self.performSegueWithIdentifier("ExamResultSegue", sender: self)
        } catch {
            print("Sorry, but something went wrong.")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "ExamResultSegue")
        {
            let controller = segue.destinationViewController as! ExamResultViewController
            controller.exam = exam
        }
    }
}
