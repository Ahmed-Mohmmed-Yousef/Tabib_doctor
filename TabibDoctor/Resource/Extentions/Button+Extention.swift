//
//  Button+Extention.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/11/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

extension UIButton{
    func addRaduiasAndShadow(){
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.4
        layer.cornerRadius = 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 4, height: 8)
    }
}
