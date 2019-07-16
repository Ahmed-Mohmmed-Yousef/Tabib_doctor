//
//  LoginController.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/13/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import Foundation

class LoginController{
    
    static var isLogin: Bool = true
    static func login(_ email: String, _ password: String, completion: @escaping(Bool?) -> Void) {
        isLogin = true
        completion(true)
    }
    static func logout(completion: @escaping(Bool?) -> Void){
        isLogin = false
        completion(true)
    }
    static func loginWithGoogle(){
        
    }
    static func loginWithPhone(){
        
    }
}
