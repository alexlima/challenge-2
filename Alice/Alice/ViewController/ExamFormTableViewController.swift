//
//  ExamFormTableViewController.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import UIKit

protocol ExamFormTableViewControllerDelegate : NSObjectProtocol
{
    func formTableViewController(controller : UIViewController, didSubmitForm form : Form)
}

class ExamFormTableViewController : BaseTableViewController, FormQuestionTableViewCellDelegate
{
    // var delegate : FormTableViewControllerDelegate! = nil
    var form = Form()
    
    // var validator = Validator()
    var validationTextFieldArrays : [UITextField] = []
    
    // MARK: - TableView Life Cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.registerNib("FormQuestion")
        self.initQuestions()
    }
    
    func initQuestions()
    {
        form.addQuestion("Do you have migraines?", alternatives: [Alternative(title: "Yes"), Alternative(title: "No")])
        form.addQuestion("How old are you?", alternatives: [Alternative(title: "15 years old or younger"), Alternative(title: "15+")])
        form.addQuestion("What is your gender?", alternatives: [Alternative(title: "Men"), Alternative(title: "Woman")])
        form.addQuestion("Do you use hallucinogenic drugs?", alternatives: [Alternative(title: "Yes"), Alternative(title: "No")])
    }
    
    // MARK: - Table view data source
    
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
        let identifier = "FormQuestionIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! FormQuestionTableViewCell
        cell.setQuestion(form.questions[indexPath.row], index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let alternatives = form.questions[indexPath.row].alternatives
        let height = 50.0 + CGFloat(50 * alternatives.count)
        return height
    }
    
    func formQuestionDidSelectAlternative(questionOrder: Int, alternativeOrder: Int) {
        print("formQuestionDidSelectAlternative \(questionOrder) = \(alternativeOrder)")
    }
    
    /*
    @IBAction func cancelLesion(sender: UIBarButtonItem)
    {
        RegisterManager.sharedInstance.register.lesions.removeLast()
        self.performSegueWithIdentifier("unwindToRegister", sender: self)
    }
    
    @IBAction func saveLesion(sender: UIBarButtonItem)
    {
        validator.validate(self)
    }
    
    func formQuestionDidSelectAlternative(questionOrder: Int, alternativeOrder: Int)
    {
        var alternatives = form.questions[questionOrder].alternatives
        for (var i = 0; i < alternatives.count; i++){
            alternatives[i].selected = false
        }
        alternatives[alternativeOrder].selected = true
        validationTextFieldArrays[questionOrder].text = "filled"
    }
    
    //MARK: Validation delegate
    func validationSuccessful() {
        RegisterManager.sharedInstance.register.lesions.last?.anamnese!.anwsers = form.answers()
        self.performSegueWithIdentifier("unwindToRegister", sender: self)
    }
    
    func validationFailed(errors: [UITextField : ValidationError]) {
        let alert = UIAlertView()
        alert.title = "Anamnese"
        alert.message = "Você precisa preencher todos os campos do formulário."
        alert.addButtonWithTitle("Entendi")
        alert.show()
    }*/
}
