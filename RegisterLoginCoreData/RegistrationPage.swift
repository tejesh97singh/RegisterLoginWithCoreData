//
//  ViewController.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 10/06/22.
//
import Foundation
import UIKit
import CoreData


class RegistrationPage: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txt_user: UITextField!
    @IBOutlet weak var txt_mailid: UITextField!
    @IBOutlet weak var txt_pwd: UITextField!
    @IBOutlet weak var txt_cpwd: UITextField!
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var choose_button: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    var newImage:UIImage?=nil
    var oneInch = 25.4.m
    var OneInch = 25.4.mm
    var test = 2.3.description()
    var test1 = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDob.delegate = self
        MainImage.applyBlurEffect()
        
        
    }
    @IBAction func ChooseButtonClicked(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pikedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            ImageView.image = pikedImage
            newImage = ImageView.image
        }
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func LoginPageButton(_ sender: UIButton) {
        print(oneInch)
        print(OneInch)
        print(test)
        var testNew = test1.resetToZero()
        print(test1)
        let secondViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
        self.navigationController?.pushViewController(secondViewController, animated: true)
    
    }
    
    @IBAction func register(_ sender: Any) {
        if !Utility.isEmptyField(inputTextField:  txt_user) {
            Utility.showAlert(title: "Alert", message: "Username Required", controller: self)
        }else if !Utility.isValidUsername(username: txt_user.text!)  {
            Utility.showAlert(title: "Alert", message: "Username must have min 4 character", controller: self)
        }else if !Utility.isEmptyField(inputTextField: txt_mailid){
            Utility.showAlert(title: "Alert", message: "Email Required", controller: self)
        }else if !Utility.isValidEmail(email: txt_mailid.text!) {
            Utility.showAlert(title: "Alert", message: "Please enter Email in correct format", controller: self)
        }else if !Utility.isEmptyField(inputTextField: txt_pwd){
            Utility.showAlert(title: "Alert", message: "Password Required", controller: self)
        }else if !Utility.isValidPassword(password: txt_pwd.text!){
            Utility.showAlert(title: "Alert", message: "Password Min 8 Charcter:  1 upper and 1 lower case character,1 Number and 1 Special Character.", controller: self)
        }else if !Utility.isEmptyField(inputTextField: txt_cpwd){
            Utility.showAlert(title: "Alert", message: "Confirm Password Required", controller: self)
        }else if (txt_pwd.text != txt_cpwd.text){
            Utility.showAlert(title: "Alert", message: "Password doesn't match", controller: self)
        }else if txtDob.text?.isEmpty ?? true{
            Utility.showAlert(title: "Alert", message: "Please Select Dob", controller: self)
        }else if newImage == nil {
            Utility.showAlert(title: "Alert", message: "Please Select an image", controller: self)
        }
        else{
                   let appDelegate = UIApplication.shared.delegate as! AppDelegate
                   let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                   var predicate = NSPredicate (format:"email = %@" ,txt_mailid.text! as String)
                   let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginDetails")
                   fetchrequest.predicate = predicate
                   do{
                          let result = try context.fetch(fetchrequest) as NSArray
                           print(result.count)
                           if result.count>0 {
                               Utility.showAlert(title: "Alert", message: "User Already Exists", controller: self)
                           }else{
                                    let app = UIApplication.shared.delegate as! AppDelegate
                                    let context = app.persistentContainer.viewContext
                                    let new_user = NSEntityDescription.insertNewObject(forEntityName: "LoginDetails", into: context) as! LoginDetails
                                    new_user.setValue(txt_user.text, forKey: "username")
                                    new_user.setValue(txt_mailid.text, forKey: "email")
                                    new_user.setValue(txt_pwd.text, forKey: "password")
                                    new_user.image = newImage?.jpegData(compressionQuality: 1) as Data?
                                    do{
                                            try context.save()
                                            print("Registered  Sucessfully")
                                            let welcomeViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "AfterLoginViewController") as? AfterLoginViewController)!
                                            self.navigationController?.pushViewController(welcomeViewController, animated: true)
                                            txt_user.text?.removeAll()
                                            txt_mailid.text?.removeAll()
                                            txt_pwd.text?.removeAll()
                                            txt_cpwd.text?.removeAll()
                                            ImageView.image = nil
                                        }catch{
                                               print(error)
                                               print("text value  insertion catch block thrown error")
                                        }
                            }
                    }catch{
                        print("User already catch block thrown error ")
                    }
               }// main else closed here
        }//register func closed here
    func datePickerTapped() {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.month = -3
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        DatePickerDialog().show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: currentDate,
                        datePickerMode: .date) { (date) in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                self.txtDob.text = formatter.string(from: dt)
            }
        }
    }
}

extension RegistrationPage: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtDob {
            datePickerTapped()
            return false
        }
        
        return true
    }
}

extension Double{
    var m: Double{return self}
    var mm: Double{return self / 1000.0}
    func description() -> String{
        return "\(self)m"
    }
    mutating func resetToZero(){
        self = 0.0
    }
}
