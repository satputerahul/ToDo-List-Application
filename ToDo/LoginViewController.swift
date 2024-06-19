//
//  LoginViewController.swift
//  ToDo
//
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var toast = Toast()
    var isChecked = false
    
    @IBOutlet var lbl_wel: UILabel!
    @IBOutlet var lbl_gld: UILabel!
    @IBOutlet var txt_eml: UITextField!
    @IBOutlet var txt_pswd: UITextField!
    @IBOutlet var btn_eye: UIButton!
    @IBOutlet var btn_restPswd: UIButton!
    @IBOutlet var btn_login: UIButton!
    @IBOutlet var lbl_lgnWth: UILabel!
    @IBOutlet var btn_google: UIButton!
    @IBOutlet var img_google: UIImageView!
    @IBOutlet var btn_fb: UIButton!
    @IBOutlet var img_fb: UIImageView!
    @IBOutlet var lbl_DntHvAcc: UILabel!
    @IBOutlet var btn_signUpNow: UIButton!
    @IBOutlet var vw_txt: UIView!
    
    @IBAction func btn_signUp(_ sender: UIButton) {
        
        let signUpStoryboard: UIStoryboard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        let signUpViewController: UIViewController = signUpStoryboard.instantiateViewController(withIdentifier: "singupStoryboard")
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
    @IBAction func btn_resetPswd(_ sender: UIButton) {
        
        let resetPasswordStoryboard: UIStoryboard = UIStoryboard(name: "ResetStoryboard", bundle: nil)
        let resetPasswordViewController: UIViewController = resetPasswordStoryboard.instantiateViewController(withIdentifier: "resetStoryboard")
        self.present(resetPasswordViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btn_login(_ sender: UIButton) {
        
        if validateFields() {
            self.toast.show(message: "Login Successfully", controller: self)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                let todoStoryboard: UIStoryboard = UIStoryboard(name: "ToDoStoryboard", bundle: nil)
                let todoViewControllere: UIViewController = todoStoryboard.instantiateViewController(withIdentifier: "ToDoList")
                self.present(todoViewControllere, animated: true, completion: nil)
            }
        }
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
    
    @IBAction func btn_eye(_ sender: UIButton) {
        
        isChecked.toggle()
        if isChecked {
            
            if let image = UIImage(named: "eye_close") {
                btn_eye.setImage(image, for: .normal)
            }
            txt_pswd.isSecureTextEntry = false
        } else {
            if let image = UIImage(named: "eye") {
                btn_eye.setImage(image, for: .normal)
            }
            txt_pswd.isSecureTextEntry = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_wel.text = "Welcome,"
        lbl_gld.text = "Glad to see you!"
        txt_eml.placeholder = "Enter a Email Id"
        txt_pswd.placeholder = "Enter a Password"
        let image = UIImage(named: "eye")
        btn_eye.setImage(image, for: .normal)
        btn_restPswd.setTitle("Reset Password", for: .normal)
        btn_login.setTitle("Login", for: .normal)
        btn_login.tintColor = UIColor.black
        lbl_lgnWth.text = "Or Login with"
        lbl_DntHvAcc.text = "Don't have an account?"
        btn_signUpNow.setTitle(" SignUp Now", for: .normal)
        
        txt_pswd.isSecureTextEntry = true
        
        txt_eml.layer.cornerRadius = 10
        txt_eml.clipsToBounds = true
        vw_txt.layer.cornerRadius = 10
        vw_txt.clipsToBounds = true
        txt_pswd.layer.cornerRadius = 10
        txt_pswd.clipsToBounds = true
        btn_login.layer.cornerRadius = 12
        btn_google.layer.cornerRadius = 12
        img_google.layer.cornerRadius = 12
        btn_fb.layer.cornerRadius = 12
        img_fb.layer.cornerRadius = 12
        btn_login.layer.borderWidth = 1.0
        btn_login.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
