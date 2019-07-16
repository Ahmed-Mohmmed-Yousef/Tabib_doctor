//
//  UIImageView+Extention.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/12/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

extension UIImageView{
    func addRaundedShadowBorder(){
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 8)
    }
    
}
