//
//  CreateNewPasswordViewController.swift
//  ToDo
//
//  Created by DevMAC01 on 24/05/24.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
    
    @IBOutlet var lbl_crtNwPswd: UILabel!
    @IBOutlet var img_crtNw: UIImageView!
    @IBOutlet var lbl_YrNwPswd: UILabel!
    @IBOutlet var lbl_newPswd: UILabel!
    @IBOutlet var txt_entrNewPswd: UITextField!
    @IBOutlet var lbl_confPswd: UILabel!
    @IBOutlet var txt_entrConfrmPswd: UITextField!
    @IBOutlet var btn_cngPswd: UIButton!
    @IBOutlet var btn_Save: UIButton!
    
    var toast = Toast()
    
    @IBAction func btn_Save(_ sender: UIButton) {
        
        self.toast.show(message: "Password Created Succesfully", controller: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            let loginStoryboard: UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
            let loginViewController: UIViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginStoryboard")
            self.present(loginViewController, animated: true, completion: nil)
            
        }
       
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_crtNwPswd.text = "Create New Password"
        let image = UIImage(named: "new_password")
        img_crtNw.image = image
        lbl_YrNwPswd.text = "Your New Password Must Be Different\n from Previously Used Password."
        lbl_newPswd.text = "New Password"
        txt_entrNewPswd.placeholder = "Enter a New Password"
        lbl_confPswd.text = "Confirm Password"
        txt_entrConfrmPswd.placeholder = "Enter a Confirm Password"
        btn_cngPswd.setTitle("Change Password", for: .normal)
        btn_Save.setTitle("Save", for: .normal)
        btn_Save.layer.cornerRadius = 12
        btn_Save.layer.borderWidth = 1.0
        btn_Save.layer.borderColor = UIColor.white.cgColor
        
       
    }
    
}
