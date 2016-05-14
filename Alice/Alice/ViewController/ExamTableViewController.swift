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
        form.addQuestion("Do you have migraines?", alternatives: [Alternative(title: "Yes"), Alternative(title: "No")])
        form.addQuestion("How old are you?", alternatives: [Alternative(title: "15 years old or younger"), Alternative(title: "15+")])
        form.addQuestion("What is your gender?", alternatives: [Alternative(title: "Men"), Alternative(title: "Woman")])
        form.addQuestion("Do you use hallucinogenic drugs?", alternatives: [Alternative(title: "Yes"), Alternative(title: "No")])
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
    
    func formQuestionDidSelectAlternative(questionOrder: Int, alternativeOrder: Int)
    {
        print("formQuestionDidSelectAlternative \(questionOrder) = \(alternativeOrder)")
    }
    
    @IBAction func cancelExam(sender: UIBarButtonItem)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveExam(sender: UIBarButtonItem)
    {
        exam.result = 50; // form.answers()
        do {
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
}
