//
//  VerifyViewController.swift
//  ToDo
//
//  Created by DevMAC01 on 24/05/24.
//

import UIKit

class VerifyViewController: UIViewController {
    
    let emlId: String = "rahulsatpute@gmail.com"
    
    @IBOutlet var lbl_verifyEml: UILabel!
    @IBOutlet var img_eml: UIImageView!
    @IBOutlet var lbl_plsEnrOtp: UILabel!
    @IBOutlet var stk_txtFld: UIStackView!
    @IBOutlet var btn_rsndCode: UIButton!
    @IBOutlet var btn_verify: UIButton!
    
    @IBAction func btn_verify(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        let crtNewPswdPswdStoryboard: UIStoryboard = UIStoryboard(name: "ResetStoryboard", bundle: nil)
        let crtNewPswdViewController: UIViewController = crtNewPswdPswdStoryboard.instantiateViewController(withIdentifier: "newPasswordStoryboard")
        present(crtNewPswdViewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btn_back(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        let resetStoryboard: UIStoryboard = UIStoryboard(name: "ResetStoryboard", bundle: nil)
        let resetViewController: UIViewController = resetStoryboard.instantiateViewController(withIdentifier: "resetStoryboard")
        self.present(resetViewController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_verifyEml.text = "Verify Your Email"
        let image = UIImage(named: "email_verify")
        img_eml.image = image
        lbl_plsEnrOtp.text = "Please Enter The 4 Digit Code Sent To \(emlId)"
        btn_rsndCode.setTitle("Resend Code", for: .normal)
        btn_verify.setTitle("Verify", for: .normal)
        btn_verify.layer.cornerRadius = 12
        btn_verify.layer.borderWidth = 1.0
        btn_verify.layer.borderColor = UIColor.white.cgColor
    }
    
}
