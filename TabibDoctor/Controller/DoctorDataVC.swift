//
//  DoctorDataVC.swift
//  TabibDoctor
//
//  Created by Ahmed on 7/11/19.
//  Copyright © 2019 Refaq, ORG. All rights reserved.
//

import UIKit
import Photos

class DoctorDataVC: UIViewController {
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var specializationTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var detailTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var costTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    let pickerSpec = UIPickerView()
    let pickerCity = UIPickerView()
    
    // static data to select from it
    let specializations = ["أسنان","عظام","انف واذن وحنجرة","نساء وتوليد","باطنة","اطفال وحديثي ولادة","مخ وأعصاب","جلدية","جراحة اطفال","قلب وأوردة دموية","أورام","تخسيس وتغذية","عيون","علاج طبيعي واصابات ملاعب","نطق وتخاطب","ذكورة وعقم","روماتيزم","صدر وجهاز تنفسي","جراحة تجميل","جراحة عامة"]
    let cities = ["سوهاج","اخميم","البلينا","المراغة"," المنشاة","دار السلام","جرجا","جهينة","ساقلته","طما","طهطا","العسيرات"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addIconsToTextField()
        
        specializationTF.inputView = pickerSpec
        cityTF.inputView = pickerCity
        pickerSpec.delegate = self
        pickerCity.delegate = self
        
        specializationTF.delegate = self
        cityTF.delegate = self
        nameTF.delegate = self
        phoneTF.delegate = self
        detailTF.delegate = self
        addressTF.delegate = self
        costTF.delegate = self
    }
    
    func addIconsToTextField(){
        specializationTF.setIcon(#imageLiteral(resourceName: "specialization"))
        cityTF.setIcon(#imageLiteral(resourceName: "city"))
        nameTF.setIcon(#imageLiteral(resourceName: "name"))
        phoneTF.setIcon(#imageLiteral(resourceName: "phone"))
        detailTF.setIcon(#imageLiteral(resourceName: "details"))
        addressTF.setIcon(#imageLiteral(resourceName: "address"))
        costTF.setIcon(#imageLiteral(resourceName: "cost"))
        submitBtn.addRaduiasAndShadow()
    }
    
    
    fileprivate func presentPhotoPickerController() {
        DispatchQueue.main.async {
            let myPickerController = UIImagePickerController()
            myPickerController.allowsEditing = true
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true)
        }
    }
    
    @IBAction func selectPhotoPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    self.presentPhotoPickerController()
                    
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized{
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library is restricted and cannot be accessed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library is denied and cannot be accessed, Please go to setting and update it", preferredStyle: .alert)
                    let goToSetting = UIAlertAction(title: "go To Setting", style: .default, handler: { (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)
                            UIApplication.shared.open(url!, options: [:])
                        }
                    })
                    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    alert.addAction(cancel)
                    alert.addAction(goToSetting)
                    self.present(alert, animated: true)
                @unknown default:
                    break
                }
            }
        }
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        guard specializationTF.hasValue, cityTF.hasValue, nameTF.hasValue,phoneTF.hasValue,addressTF.hasValue,costTF.hasValue else{ return }
        endEditing()
        let cost = (costTF.text! as NSString).doubleValue
        DoctorDataController.setDoctorData(imgPhoto.image!, specializationTF.text!, cityTF.text!, nameTF.text!, phoneTF.text!, detailTF.text!, addressTF.text!, cost) { (success) in
            if success!{
                
                self.pushAlert(msg: "All Done", completion: {
                    self.performSegue(withIdentifier: "backFromDoctorDataToProfile", sender: nil)
                })
            } else{
                
                self.pushAlert(msg: "Error accured", completion: nil)
            }
        }
    }
    
    func pushAlert(msg: String, completion: (() -> ())?){
        let alert = UIAlertController(title: "Info", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            if let completion = completion{
                completion()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension DoctorDataVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if specializationTF.inputView == pickerView{
            return specializations.count
        } else {
            return cities.count
        }
    }
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if specializationTF.inputView == pickerView{
            return specializations[row]
        } else {
            return cities[row]
        }
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if specializationTF.inputView == pickerView{
            specializationTF.text = specializations[row]
        } else {
            cityTF.text = cities[row]
        }
        endEditing()
    }
    
    
}

extension DoctorDataVC: UITextFieldDelegate{
    
    //MARK:- text field Delegates
    func endEditing(){
        bottomConstrain.constant = 16
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

extension DoctorDataVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage{
            self.imgPhoto.image = image
        }
        else if let image = info[.originalImage] as? UIImage{
            self.imgPhoto.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
