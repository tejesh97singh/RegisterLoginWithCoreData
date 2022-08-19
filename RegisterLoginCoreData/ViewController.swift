//
//  ViewController.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 11/06/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var text_username: UITextField!
    @IBOutlet weak var text_password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var result = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LogIn(_ sender: Any) {
        if !Utility.isEmptyField(inputTextField: text_username){
            Utility.showAlert(title: "Alert", message: "Email Required", controller: self)
        }else if !Utility.isValidEmail(email: text_username.text!){
            Utility.showAlert(title: "Alert", message: "Enter Correct Email", controller: self)
        }else if !Utility.isEmptyField(inputTextField: text_password){
            Utility.showAlert(title: "Alert", message: "Password Required", controller: self)
        }else if !Utility.isValidPassword(password: text_password.text!){
            Utility.showAlert(title: "Alert", message: "Enter Correct Password", controller: self)
        }else{
                CheckForUserNameAndPasswordMatch(email : text_username.text! as String, password : text_password.text! as String)
            
            let welcomeViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "AfterLoginViewController") as? AfterLoginViewController)!
            self.navigationController?.pushViewController(welcomeViewController, animated: true)
        }
    }
    func CheckForUserNameAndPasswordMatch (email : String, password : String) ->Bool
       {
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
           var predicate = NSPredicate (format:"email = %@" ,email)
           let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginDetails")
           fetchrequest.predicate = predicate

           do
               {
                   result = try context.fetch(fetchrequest) as NSArray

                   //print(fetchrequest)
                   if result.count>0
                   {
                       print(result.count)
                       let objectentity = result.firstObject as! LoginDetails
                       if objectentity.email == email && objectentity.password == password
                       {
                           print("Login Succesfully")
                           let welcomeViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "AfterLoginViewController") as? AfterLoginViewController)!
                           self.navigationController?.pushViewController(welcomeViewController, animated: true)

                       }
                       else
                       {
                           Utility.showAlert(title: "Alert", message: "Wrong Email or Password", controller: self)
                       }
                   }else{
                       Utility.showAlert(title: "Alert", message: "User doesn't exist", controller: self)
                       print("No User Found")
                   }
               }

               catch
               {
                   let fetch_error = error as NSError
                   print("error", fetch_error.localizedDescription)
               }

return true
       }
    
    
}


