//
//  ReservationVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/13/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class ReservationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tab bar image
        self.tabBarController?.tabBar.items?[2].image = #imageLiteral(resourceName: "Reservations")
        self.tabBarController?.tabBar.items?[2].selectedImage = #imageLiteral(resourceName: "Reservations")
    }
    

}
