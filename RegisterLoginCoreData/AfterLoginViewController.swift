//
//  AfterLoginViewController.swift
//  RegisterLoginCoreData
//
//  Created by Tejesh Singh on 13/06/22.
//

import UIKit

protocol Flashable{
    func Flash()
}

protocol Raisable {
    func Raise()
}

class NewView: UIView, Flashable, Raisable{}


class AfterLoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    override  func loadView() {
         let view = NewView()
         view.backgroundColor = .orange
         view.Raise()
         self.view = view
     }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        let loginViewController: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Flashable where Self: UIView {
    func Flash(){
        alpha = 1
        UIView.animate(withDuration: 0.3, delay: 0.25, options: [.repeat, .autoreverse], animations: {self.alpha=0
    })
}
}

extension Raisable where Self: UIView{
    func Raise(){
        transform = .identity
        UIView.animate(withDuration: 1, delay: 0.25, options: [.repeat, .autoreverse], animations: {self.transform = CGAffineTransform(scaleX: 1, y: 3)
    })
    }
}



