//
//  cashPopupViewController.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//

import UIKit

protocol cashPopupViewControllerprotocol {
    func fetchdata()
}

class cashPopupViewController: UIViewController {
    
    @IBOutlet weak var cashPopUpView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var DtlTF: UITextField!
    @IBOutlet weak var amountTF: UITextField!
    
    let expenseContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var expEntityList : [ExpenseEntity]?
    var delegate : cashPopupViewControllerprotocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cashPopUpView.layer.cornerRadius = 30
        self.doneBtn.layer.cornerRadius = 12
        DtlTF.addDoneButton(title:"Done" , target: self, selector: #selector(tapDone(sender:)))
        amountTF.addDoneButton(title:"Done" , target: self, selector: #selector(tapDone(sender:)))
        
    }
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    func fetchContext() {
        do {
            self.expEntityList =  try expenseContext.fetch(ExpenseEntity.fetchRequest())
        }
        catch {
            print("Error While fetching!...")
        }
        
    }
    @IBAction func doneBtnAction(_ sender: UIButton) {
        
        //create
        let NewdataToEntity = ExpenseEntity(context: self.expenseContext)
        
        NewdataToEntity.name = DtlTF.text
        let doubleValAmt = Double(amountTF.text ?? "")
        NewdataToEntity.amount =  doubleValAmt ?? 0.0
        
        //save
        do {
            try self.expenseContext.save()
            
        }
        catch
         {
            print("Error While saving!...")
        }
        
        //fetch
        self.fetchContext()
        self.delegate?.fetchdata()
        self.dismiss(animated: true)
    }
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
extension UITextField {
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        toolBar.setItems([flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}
