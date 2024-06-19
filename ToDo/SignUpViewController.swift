//
//  SignUpViewController.swift
//  ToDo
//
//  Created by DevMAC01 on 18/05/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    var toast = Toast()
    var isChecked = false
    
    @IBOutlet var lbl_crtAcc: UILabel!
    @IBOutlet var lbl_toGetStart: UILabel!
    @IBOutlet var txt_eml: UITextField!
    @IBOutlet var txt_pswd: UITextField!
    @IBOutlet var txt_confmPswd: UITextField!
    @IBOutlet var btn_signUp: UIButton!
    @IBOutlet var lbl_orSign: UILabel!
    @IBOutlet var btn_google: UIButton!
    @IBOutlet var img_google: UIImageView!
    @IBOutlet var btn_fb: UIButton!
    @IBOutlet var img_fb: UIImageView!
    @IBOutlet var lbl_alrdyHvAcc: UILabel!
    @IBOutlet var btn_loginNow: UIButton!
    @IBOutlet var btn_pswdEye: UIButton!
    @IBOutlet var btn_confmPswdEye: UIButton!
    @IBOutlet var vw_pswd: UIView!
    @IBOutlet var vw_confmPswd: UIView!
    
    
    @IBAction func btn_Login(_ sender: UIButton) {
        
        let loginStoryboard: UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginViewController: UIViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginStoryboard")
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btn_signUp(_ sender: UIButton) {
        
        if validateFields() {
            if txt_pswd.text == txt_confmPswd.text {
                self.toast.show(message: "Account Created Successfully", controller: self)
            } else {
                self.toast.show(message: "Password do not match", controller: self)
                txt_confmPswd.text = ""
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txt_confmPswd {
            
            if txt_pswd.text != txt_confmPswd.text {
                
                self.toast.show(message: "Password do not match", controller: self)
                
                txt_confmPswd.text = ""
            }
            textField.resignFirstResponder()
        }
        
        return true
        
    }
    
    func validateFields() -> Bool {
        
        guard let email = txt_eml.text, !email.isEmpty else {
            self.toast.show(message: "Email is required", controller: self)
            return false
        }
        
        guard let password = txt_pswd.text, !password.isEmpty else {
            self.toast.show(message: "Password is required", controller: self)
            return false
        }
        
        guard let cnfrmPassword = txt_confmPswd.text, !cnfrmPassword.isEmpty else {
            self.toast.show(message: "Password is required", controller: self)
            return false
        }
        
        if !isValidEmail(email) {
            self.toast.show(message: "Invalid email format", controller: self)
            return false
        }
        
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
        
    }
    
    @IBAction func btn_pswdEye(_ sender: UIButton) {
        
        isChecked.toggle()
        if isChecked {
            
            //If true, set the button image to "eye_close" and show the password
            if let image = UIImage(named: "eye_close") {
                btn_pswdEye.setImage(image, for: .normal)
            }
            //makes the password visible
            txt_pswd.isSecureTextEntry = false
            
        } else {
            
            //If false, set the button image to "eye" and hide the password
            if let image = UIImage(named: "eye") {
                btn_pswdEye.setImage(image, for: .normal)
            }
            //hides the password
            txt_pswd.isSecureTextEntry = true
            
        }
        
    }
    
    @IBAction func btn_confrmPswdEye(_ sender: UIButton) {
        
        isChecked.toggle()
        if isChecked {
            
            if let image = UIImage(named: "eye_close") {
                btn_confmPswdEye.setImage(image, for: .normal)
            }
            txt_confmPswd.isSecureTextEntry = false
            
        } else {
            
            if let image = UIImage(named: "eye") {
                btn_confmPswdEye.setImage(image, for: .normal)
            }
            txt_confmPswd.isSecureTextEntry = true
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_crtAcc.text = "Create Account"
        lbl_toGetStart.text = "to get started now!"
        btn_signUp.setTitle("Sign Up", for: .normal)
        lbl_orSign.text = "Or SignUp with"
        lbl_alrdyHvAcc.text = "Already have an account?"
        btn_loginNow.setTitle(" Login Now", for: .normal)
        txt_eml.placeholder = "Enter a Email Id"
        txt_pswd.placeholder = "Enter a Password"
        txt_confmPswd.placeholder = "Enter a Confirm Password"
        let image = UIImage(named: "eye")
        btn_pswdEye.setImage(image, for: .normal)
        btn_confmPswdEye.setImage(image, for: .normal)
        
        txt_pswd.isSecureTextEntry = true
        txt_confmPswd.isSecureTextEntry = true
        
        vw_pswd.layer.cornerRadius = 10
        vw_confmPswd.layer.cornerRadius = 10
        txt_eml.layer.cornerRadius = 10
        txt_eml.clipsToBounds = true
        txt_pswd.layer.cornerRadius = 10
        txt_pswd.clipsToBounds = true
        txt_confmPswd.layer.cornerRadius = 10
        txt_confmPswd.clipsToBounds = true
        btn_signUp.layer.cornerRadius = 12
        btn_google.layer.cornerRadius = 12
        img_google.layer.cornerRadius = 12
        btn_fb.layer.cornerRadius = 12
        img_fb.layer.cornerRadius = 12
        btn_signUp.layer.borderWidth = 1.0
        btn_signUp.layer.borderColor = UIColor.white.cgColor
        txt_eml.layer.borderWidth = 1.0
        txt_eml.layer.borderColor = UIColor.white.cgColor
        txt_pswd.layer.borderWidth = 1.0
        txt_pswd.layer.borderColor = UIColor.white.cgColor
        txt_confmPswd.layer.borderWidth = 1.0
        txt_confmPswd.layer.borderColor = UIColor.white.cgColor
        txt_eml.textColor = UIColor.black
        txt_pswd.textColor = UIColor.black
        txt_confmPswd.textColor = UIColor.black
        
/*        let emailPlaceholderText = "Enter a Email Id"
        let emailPlaceholderColor = UIColor.white
        txt_eml.attributedPlaceholder = NSAttributedString(string: emailPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor: emailPlaceholderColor])
        
        let passwordPlaceholderText = "Enter a Password"
        let passwordPlaceholderColor = UIColor.white
        txt_pswd.attributedPlaceholder = NSAttributedString(string: passwordPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor: passwordPlaceholderColor])
       
        let confPassPlaceholderText = "Enter a Confirm Password"
        let confPassPlaceholderColor = UIColor.white
        txt_confmPswd.attributedPlaceholder = NSAttributedString(string: confPassPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor: confPassPlaceholderColor])
*/
    }
    
}
