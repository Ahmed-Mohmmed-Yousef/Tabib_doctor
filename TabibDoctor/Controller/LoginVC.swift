//
//  LoginVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/10/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // animation
        animateLogo()
        
        // Keyboard Register
        self.registerForKeyboardNotification()
        googleBtn.addRaduiasAndShadow()
        phoneBtn.addRaduiasAndShadow()
        loginBtn.addRaduiasAndShadow()
        
    }
    
    func animateLogo(){
        // 360 * pi/180
        let width = view.frame.width
        let height = view.frame.height
        let animeView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        animeView.backgroundColor = UIColor.white
        let animeImage = UIImageView(frame: CGRect(x: (width/2 - 150), y: (height/2 - 250), width: 300, height: 300))
        animeImage.image = #imageLiteral(resourceName: "caduceus")
        
        view.addSubview(animeView)
        animeView.addSubview(animeImage)
        
        let radians = CGFloat(200 * Double.pi / 180)
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn], animations: {
            animeImage.alpha = 0
            animeImage.transform = CGAffineTransform(rotationAngle: radians).scaledBy(x: 3, y: 3)
            
            let yRoyation = CATransform3DMakeRotation(radians, 0, radians, 0)
            animeImage.layer.transform = CATransform3DConcat(animeImage.layer.transform, yRoyation)
            
        }) { (success) in
            animeView.removeFromSuperview()
        }
    }
    
    @IBOutlet weak var emailLine: UIView!
    @IBAction func BEdit(_ sender: Any) {
        emailLine.backgroundColor = UIColor.red
    }
    
    @IBAction func doneEidting(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func loginPressed(_ sender: Any) {
    }
    @IBAction func forgetPassworedPressed(_ sender: Any) {
    }
    @IBAction func signWithGooglePressed(_ sender: Any) {
    }
    @IBAction func signWithPhonePressed(_ sender: Any) {
    }
    @IBAction func notHaveAccountPressed(_ sender: Any) {
    }
    
    //  Keyboard controlle
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWaillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification){
        guard let info = notificiation.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWaillBeHidden(_ notificiation: NSNotification){
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
