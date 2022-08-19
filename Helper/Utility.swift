//
//  Utility.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 23/06/22.
//

import Foundation
import UIKit
import CoreData

class Utility: UIViewController {
    
    class func isValidUsername(username: String) -> Bool {
        let RegEx = "^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$"
        return NSPredicate(format:"SELF MATCHES %@", RegEx).evaluate(with: username)
    }
    class func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    } 
    class func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    class func showAlert(title: String, message: String, controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        controller.present(alert, animated: true, completion: nil)
    }
    class func isEmptyField(inputTextField: UITextField) -> Bool {
        if inputTextField.text?.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).count == 0 {
               return false
        }else{
               return true
        }
    }
    
}
