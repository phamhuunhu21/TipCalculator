//
//  MainViewController.swift
//  TipCalculator_13110121
//
//  Created by Pham Huu Nhu on 6/1/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    
    @IBOutlet weak var txtMoney: UITextField!{
        didSet{
            txtMoney.keyboardType = UIKeyboardType.numberPad
        }
    }
    @IBOutlet weak var txtTipAmount: UITextField!{
        didSet{
            txtTipAmount.keyboardType = UIKeyboardType.numberPad
        }
    }
    @IBOutlet weak var txtResult: UITextField!
    
    var tip = "0";
    
    var money: Double!
    var tipAmount: Double!
    var result: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeKeyboard();
        if(tip != "0")
        {
            txtTipAmount.text = tip;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //calculate
    @IBAction func btnCalculate(_ sender: Any) {
        userTapOnScreen(sender);
        if txtMoney.text!.isEmpty || txtTipAmount.text!.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            money = Double(txtMoney.text!);
            tipAmount = Double(txtTipAmount.text!);
            result = (money*tipAmount)/100;
            txtResult.text = String(result);
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            
            let newHistory = NSEntityDescription.insertNewObject(forEntityName: "TipHistory", into: context) as NSManagedObject
            newHistory.setValue(txtMoney.text, forKey: "money")
            newHistory.setValue(txtTipAmount.text, forKey: "tipAmount")
            newHistory.setValue(txtResult.text, forKey: "result")
            
            do {
                try context.save()
            } catch {
                fatalError("Có lỗi trong qua trình: \(error)")
            }
            
        }

    }
    
    //user click - return keyboard
    @IBAction func userTapOnScreen(_ sender: Any) {
        txtMoney.resignFirstResponder();
        txtTipAmount.resignFirstResponder();
    }
    
    fileprivate func observeKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window);
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window);
    }
    //show keyboard
    func keyboardWillShow(sender: NSNotification) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -80, width: self.view.frame.width ,height: self.view.frame.height)
        }, completion: nil)
    }
    //hide keyboard
    func keyboardWillHide(sender: NSNotification) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
}
