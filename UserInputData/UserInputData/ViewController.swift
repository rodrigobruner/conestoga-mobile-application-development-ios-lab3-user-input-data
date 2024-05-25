//
//  ViewController.swift
//  UserInputData
//
//  Created by user249117 on 5/24/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtCountry: UITextField!
    
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var txtViewResult: UITextView!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    @IBAction func btnAdd(_ sender: Any) {
        let firstName = txtFirstName.text ?? ""
        let lastName = txtLastName.text ?? ""
        let country = txtCountry.text ?? ""
        let age = txtAge.text ?? ""
        
        let emptyField = fieldsAreEmpty()
        
        if emptyField == false {
            txtViewResult.text += "Full name: \(firstName) \(lastName)"
            txtViewResult.text += "\nCountry: \(country)"
            txtViewResult.text += "\nAge: \(age)"
            txtViewResult.text += "\n------------------------------------\n"
            
            let range = NSMakeRange(txtViewResult.text.count - 0, 0)
            txtViewResult.scrollRangeToVisible(range)
           
            lblResult.isHidden = true
        } else{
            lblResult.textColor = UIColor.red
            lblResult.text = "Complete the missing info!"
            lblResult.isHidden = false
        }
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        let emptyField = fieldsAreEmpty()
        
        if emptyField == false || !txtViewResult.text.isEmpty{
            lblResult.textColor = UIColor.green
            lblResult.text = "Successfully submitted!"
            lblResult.isHidden = false
            txtViewResult.text=""
            clearFields()
        } else{
            lblResult.textColor = UIColor.red
            lblResult.text = "Complete the missing info!"
            lblResult.isHidden = false
        }
    }
    
    
    func fieldsAreEmpty() -> Bool{
        let firstName = txtFirstName.text ?? ""
        let lastName = txtLastName.text ?? ""
        let country = txtCountry.text ?? ""
        let age = txtAge.text ?? ""
        
        var emptyField = 0;
        
        if (firstName.isEmpty) {
           emptyField += 1
        }
        
        if (lastName.isEmpty) {
           emptyField += 1
        }
        
        if (country.isEmpty) {
           emptyField += 1
        }
        
        if (age.isEmpty) {
           emptyField += 1
        }
        
        return (emptyField > 0)
    }
    
    func clearFields(){
        txtFirstName.text = ""
        txtLastName.text=""
        txtCountry.text = ""
        txtAge.text=""
    }
    
    @IBAction func btnClear(_ sender: Any) {
        lblResult.isHidden = true
        txtViewResult.text=""
        clearFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtAge.delegate = self
        txtViewResult.isScrollEnabled=true
        txtViewResult.isUserInteractionEnabled=true
        txtViewResult.isEditable=false
    }
    
    //MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }


}

