//
//  RatingVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/13/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tab bar image
        self.tabBarController?.tabBar.items?[3].image = #imageLiteral(resourceName: "Ratings")
        self.tabBarController?.tabBar.items?[3].selectedImage = #imageLiteral(resourceName: "Ratings")
    }

}
