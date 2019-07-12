//
//  SignUpVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/12/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var sinUpBtn: UIButton!
   
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
        
        // text feild logo
        emailTF.setIcon(#imageLiteral(resourceName: "email"))
        passwordTF.setIcon(#imageLiteral(resourceName: "password"))
        
        sinUpBtn.addRaduiasAndShadow()
        
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        endEditing()
    }
    
}

extension SignUpVC: UITextFieldDelegate{
    
    //MARK:- text field Delegates
    func endEditing(){
        bottomConstrain.constant = 24
        view.endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomConstrain.constant = 300
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
}
