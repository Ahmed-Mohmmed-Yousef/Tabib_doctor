//
//  ProfileVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/12/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet var clincImgs: [UIImageView]!
    @IBOutlet var ratingImgs: [UIImageView]!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var SpcializeLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var briefSummaryLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var numberOfK: UILabel!
    @IBOutlet weak var totalNumberOfK: UILabel!
    @IBOutlet weak var stackViewToEdit: UIStackView!
    @IBOutlet weak var SVBottonConstrain: NSLayoutConstraint!
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        if !LoginController.isLogin{
            self.presentLoginVC()
        }
        
        if !DoctorDataController.isAllDataCopleted{
            self.presentDoctoDataVC()
        }
        setupInf()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImg.addRaundedShadowBorder()
        addBtn.AddRoundedShadowButn()
        //disAppear()
        setupInf()
        let radians = CGFloat(300 * Double.pi / 180)
        self.addBtn.transform = CGAffineTransform(rotationAngle: radians)
//        let yRoyation = CATransform3DMakeRotation(radians, 0, radians, 0)
//        self.addBtn.layer.transform = CATransform3DConcat(self.addBtn.layer.transform, yRoyation)
    }
    
    /// Edit button functions
    @objc func appearBtns(){
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 60, animations: {
                self.SVBottonConstrain.constant = 8
                self.stackViewToEdit.alpha = 1
            }) { (success) in
                self.addBtn.addTarget(self, action: #selector(self.disAppear), for: .touchUpInside)
            }
        }
    }
    
    @objc func disAppear(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 60, animations: {
                self.SVBottonConstrain.constant = -300
                self.stackViewToEdit.alpha = 0
                // 360 * pi/180
                let radians = CGFloat(200 * Double.pi / 180)
                self.addBtn.transform = CGAffineTransform(rotationAngle: radians)
                let yRoyation = CATransform3DMakeRotation(radians, 0, radians, 0)
                self.addBtn.layer.transform = CATransform3DConcat(self.addBtn.layer.transform, yRoyation)
            }) { (success) in
                self.addBtn.addTarget(self, action: #selector(self.appearBtns), for: .touchUpInside)
            }
        }
    }
    
    func setupInf(){
        if let docImge = DOCTOR_IMAGE{
            self.profileImg.image = docImge
        } else{
            self.profileImg.image = #imageLiteral(resourceName: "profile2")
        }
        
        nameLbl.text = DOCTOR_NAME
        SpcializeLbl.text = DOCTOR_SPCIALIZATION
        addressLbl.text = DOCTOR_ADDRESS
        briefSummaryLbl.text = DOCTOR_DETAILS
        setRatingImgs()
        // clinck imahes
        for index in 0...4{
            self.clincImgs[index].image = CLINC_IMGES?[index]
        }
    }
    
    func setRatingImgs(){
        for imgView in ratingImgs{
            imgView.image = #imageLiteral(resourceName: "star")
        }
        for index in 0...DOCTOR_RATING - 1{
            self.ratingImgs[index].image = #imageLiteral(resourceName: "star_filled")
        }
    }
    
    func presentLoginVC(){
        let vc = LoginVC.getInstance() as! UINavigationController
        self.present(vc, animated: true, completion: nil)
    }
    
    func presentDoctoDataVC(){
        let vc = DoctorDataVC.getInstance() as! DoctorDataVC
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}


}
