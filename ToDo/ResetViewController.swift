//
//  ResetViewController.swift
//  ToDo
//
//  Created by DevMAC01 on 18/05/24.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet var img_rstPswd: UIImageView!
    @IBOutlet var lbl_entrEml: UILabel!
    @IBOutlet var lbl_eml: UILabel!
    @IBOutlet var txt_eml: UITextField!
    @IBOutlet var btn_tryanthrway: UIButton!
    @IBOutlet var btn_send: UIButton!
    @IBOutlet var lbl_resetPswd: UILabel!
    
    
    
    
    @IBAction func btn_back(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        let loginStoryboard: UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginViewController: UIViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginStoryboard")
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btn_send(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        let verifyStoryboard: UIStoryboard = UIStoryboard(name: "ResetStoryboard", bundle: nil)
        let verifyViewController: UIViewController = verifyStoryboard.instantiateViewController(withIdentifier: "verifyStoryboard")
        self.present(verifyViewController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img_rstPswd.image = UIImage(named: "reset-password")
        lbl_entrEml.text = "Please Enter Your Email Address To Receive a Verification Code"
        lbl_eml.text = " Email Address"
        txt_eml.placeholder = "Enter a Email Adrress"
        btn_tryanthrway.setTitle("Try another way", for: .normal)
        btn_send.setTitle("Send", for: .normal)
        lbl_resetPswd.text = "Forget Password"
        
        txt_eml.layer.cornerRadius = 10
        txt_eml.clipsToBounds = true
        btn_send.layer.cornerRadius = 10
        btn_send.layer.borderWidth = 1.0
        btn_send.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
