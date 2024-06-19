//
//  ViewController.swift
//  ToDo
//
//  Created by DevMAC01 on 18/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var img_toDoList: UIImageView!
    @IBOutlet var lbl_toDoList: UILabel!
    @IBOutlet var btn_login: UIButton!
    @IBOutlet var btn_signUp: UIButton!
    @IBOutlet var btn_cntGst: UIButton!
    
    
    @IBAction func btn_Login(_ sender: UIButton) {
        
        let loginStoryboard: UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginViewController: UIViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginStoryboard")
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btn_signUp(_ sender: UIButton) {
        
        let signUpStoryboard: UIStoryboard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        let signUpViewController: UIViewController = signUpStoryboard.instantiateViewController(withIdentifier: "singupStoryboard")
        self.present(signUpViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btn_cntGuest(_ sender: UIButton) {
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let image = UIImage(named: "to-do-list")
        img_toDoList.image = image
        lbl_toDoList.text = "ToDo List"
        lbl_toDoList.textAlignment = .center
        btn_login.setTitle("Login", for: .normal)
        btn_signUp.setTitle("SignUp", for: .normal)
        btn_cntGst.setTitle("Continue as a guest", for: .normal)
        
        btn_login.layer.borderWidth = 1.0
        btn_login.layer.borderColor = UIColor.white.cgColor
        btn_login.layer.cornerRadius = 12
        btn_signUp.layer.borderWidth = 1.0
        btn_signUp.layer.borderColor = UIColor.white.cgColor
        btn_signUp.layer.cornerRadius = 12
        
        lbl_toDoList.layer.shadowColor = UIColor.black.cgColor
        lbl_toDoList.layer.shadowRadius = 3.0
        lbl_toDoList.layer.shadowOpacity = 1.0
        lbl_toDoList.layer.shadowOffset = CGSize(width: 4, height: 4)
        lbl_toDoList.layer.masksToBounds = false
        
    }


}

