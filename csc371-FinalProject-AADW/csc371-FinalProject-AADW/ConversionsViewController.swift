//
//  ConversionsViewController.swift
//  csc371-FinalProject-AADW
//
//  Created by DeAngelo Deshawn Wilson on 3/14/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import UIKit

protocol typeEnum {
    func get(val:Double) -> String
}

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
enum moneyTypes : Int, typeEnum{
    func get(val: Double) -> String {
        switch self {
        case .Euro:
            return "Euros"
        case .USD:
            return "USD"
        case .Peso:
            return "Pesos"
        }
    }
    
    case USD
    case Euro
    case Peso
}

enum speedTypes : Int, typeEnum{
    case MPH
    case KPH
    
    func get(val: Double) -> String {
        switch self {
        case .KPH:
            return "KPH"
        case .MPH:
            return "MPH"
        }
    }
}

enum tempTypes : Int, typeEnum {
    case kelvin
    case celcius
    case fareheit
    func get(val:Double) -> String {
        switch self {
        case .celcius:
            return "Celcius"
        case .kelvin:
            return "Kelvin"
        case .fareheit:
            return "Farenheit"
        }
    }
}

enum distanceTypes : Int, typeEnum{
    case meter
    case centi
    case kilo
    case nano
    case micro
    case mile
    case yard
    case foot
    case inch
    case ly
    func get(val:Double) -> String{
            switch self {
            case .meter:
                return (val>=1) ? "Meters":"Meter"
            case .centi:
                return (val>=1) ? "Centimeters":"Centimeter"
            case .kilo:
                return (val>=1) ? "Kilometers":"Kilometer"
            case .nano:
                return (val>=1) ? "NanoMeters":"Nanometer"
            case .micro:
                return (val>=1) ? "Micrometers":"Micrometer"
            case .mile:
                return (val>=1) ? "Miles":"Mile"
            case .yard:
                return (val>=1) ? "Yards":"Yard"
            case .foot:
                return (val>=1) ? "Feet":"Foot"
            case .inch:
                return (val>=1) ? "Inches":"Inch"
            case .ly:
                return (val>=1) ? "Light Years":"Light Year"
                
            }
    }
}
 

class ConversionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var toField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    var cType:conversionIdentifier?
    //conversion array*/ type enum set by CCTable during segue
    var cEnum:typeEnum?
    var conversionArray:[String]?
    var fromValue = 0
    var toValue = 0
    
    
    
    @IBAction func convert(_ sender: UIButton) {
        if let ar = conversionArray {
            //string conversion type.
            let fromUnit = ar[picker.selectedRow(inComponent: 0)]
            let toUnit = ar[picker.selectedRow(inComponent: 1)]
            
            //call conversion function for appropriate cType (conversion type)
            if let type = cType{
                switch type{
                case .money:
                    moneyConversion(from: fromUnit, to: toUnit)
                case .distance:
                    distanceConversion(from: fromUnit, to: toUnit)
                case .speed:
                    speedConversion(from: fromUnit, to: toUnit)
                case .temperature:
                    tempConversion(from: fromUnit, to: toUnit)
                }
            }

            
            //fromUnit
        }


        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let ar = conversionArray else {return 0}
        return ar.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //cType?.rawValue
        if let ar = conversionArray{
            return ar[row]
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

    override func viewWillAppear(_ animated: Bool) {
        /*
        if let type = cType{
            switch type {
            case .money:
                cEnum = (moneyTypes as? typeEnum)                //conversionArray = moneyConversions
            case .distance:
                cEnum = distanceTypes
                //conversionArray = distanceConversions
            case .speed:
                cEnum = speedTypes
                //conversionArray = speedConversions
            case .temperature:
                cEnum = tempTypes
                //conversionArray = tempConversions
            }
        }*/
 
        
    }
    
    func moneyConversion(from fU:String, to tU:String){
        /*
        switch tU {
         case .USD:
         */
    }
    func distanceConversion(from fU:String, to tU:String){
        
    }
    func speedConversion(from fU:String, to tU:String){
        
    }
    func tempConversion(from fU:String, to tU:String){
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    /* END conversion functions ******************************/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
