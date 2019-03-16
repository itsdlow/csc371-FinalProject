//
//  ConversionsViewController.swift
//  csc371-FinalProject-AADW
//
//  Created by DeAngelo Deshawn Wilson on 3/14/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import UIKit

let distanceConversions = [
    "Meters", "Centimeters", "Kilometer", "Nanometer", "Micrometer",
    "Mile", "Yard", "Foot", "Inch", "Light Year"
]

let moneyConversions = [
    "USD", "Euro", "Peso"
]

let speedConversions = [
    "MPH","KPH"
]
let tempConversions = [
    "Kelvin","Celsius","Farenheit"
]

class ConversionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var toField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    var cType:conversionIdentifier?
    
    
    
    @IBAction func convert(_ sender: UIButton) {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let type = cType{
            switch type {
            case .distance:
                return distanceConversions.count
            case .money:
                return moneyConversions.count
            case .speed:
                return speedConversions.count
            case .temperature:
                 return tempConversions.count
            }
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let type = cType{
            switch type {
            case .distance:
                return distanceConversions[row]
            case .money:
                return moneyConversions[row]
            case .speed:
                return speedConversions[row]
            case .temperature:
                 return tempConversions[row]
            }
        }
        return nil

    }

    @IBAction func backgroundTouched(_ sender: UIControl) {
        fromField.resignFirstResponder()
        toField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        
    }
     */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
