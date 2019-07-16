//
//  ViewController+Extention.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/13/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit


extension UIViewController{
    static func getInstance() -> UIViewController {
        
        /**
         just return view controller on storyboard
         */
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}

