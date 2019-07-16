//
//  TimesVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/13/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class TimesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // set tab bar images
        self.tabBarController?.tabBar.items?[1].image = #imageLiteral(resourceName: "times")
        self.tabBarController?.tabBar.items?[1].selectedImage = #imageLiteral(resourceName: "times")
    }
    

}
