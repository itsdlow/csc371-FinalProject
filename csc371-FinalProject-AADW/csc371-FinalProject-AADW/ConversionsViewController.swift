//
//  ConversionsViewController.swift
//  csc371-FinalProject-AADW
//
//  Created by DeAngelo Deshawn Wilson on 3/14/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import UIKit


/*
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
*/

protocol typeEnum {
    func get(val:Double) -> String
    func count() -> Int
}

enum moneyTypes : Int, typeEnum{
    func count() -> Int {
        return 3
    }
    
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
    func count() -> Int {
        return 2
    }
    
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
    func count() -> Int {
        return 3
    }
    
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
    func count() -> Int {
        return 10
    }
    
    case meter
    case centi
    case milli
    case kilo
    case mile
    case yard
    case foot
    case inch
    func get(val:Double) -> String{
            switch self {
            case .meter:
                return (val>=1) ? "Meters":"Meter"
            case .centi:
                return (val>=1) ? "Centimeters":"Centimeter"
            case .milli:
                return (val>=1) ? "Millimeters":"Millimeter"
            case .kilo:
                return (val>=1) ? "Kilometers":"Kilometer"
            case .mile:
                return (val>=1) ? "Miles":"Mile"
            case .yard:
                return (val>=1) ? "Yards":"Yard"
            case .foot:
                return (val>=1) ? "Feet":"Foot"
            case .inch:
                return (val>=1) ? "Inches":"Inch"
                
            }
    }
}
 


class ConversionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    //cType set by CCTable during segue
    var cType:conversionIdentifier?
    //var conversionArray:[String]?
    
    var fromValue:Double = 0
    var toValue:Double = 0
    
    
    
    @IBAction func convert(_ sender: UIButton) {
        guard let x = Double(fromField.text!) else {return}
        fromValue = x
        //print("x:"+x.description)
        //string conversion type.
        let fromUnit = picker.selectedRow(inComponent: 0)
        //let fromUnit = ar[picker.selectedRow(inComponent: 0)]
        //let toUnit = ar[picker.selectedRow(inComponent: 1)]
        let toUnit = picker.selectedRow(inComponent: 1)
        
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
        //print(toValue)
        toLabel.text? = (round(toValue*100) / 100).description
        //String(format: "%f", toValue)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let type = cType else {return 0}
        switch  type{
        case .money:
            return (moneyTypes(rawValue: 0)?.count())!
        case .distance:
            return (distanceTypes(rawValue: 0)?.count())!
        case .speed:
            return (speedTypes(rawValue: 0)?.count())!
        case .temperature:
            return (tempTypes(rawValue: 0)?.count())!
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let type = cType else {return nil}
        switch type {
        case .distance:
            return distanceTypes(rawValue: row)?.get(val: fromValue)
        case .money:
            return moneyTypes(rawValue: row)?.get(val: fromValue)
        case .speed:
            return speedTypes(rawValue: row)?.get(val: fromValue)
        case .temperature:
            return tempTypes(rawValue: row)?.get(val: fromValue)
        }

    }

    @IBAction func backgroundTouched(_ sender: UIControl) {
        fromField.resignFirstResponder()
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
                conversionArray = moneyConversions
            case .distance:
                conversionArray = distanceConversions
            case .speed:
                conversionArray = speedConversions
            case .temperature:
                conversionArray = tempConversions
            }
        }*/
 
        
    }
    /*===========================Conversion functions==================================*/
   
    
    
    
    
    func moneyConversion(from fU:Int, to tU:Int){
        let toUnit:moneyTypes = moneyTypes(rawValue: tU)!
        let fromUnit:moneyTypes = moneyTypes(rawValue: fU)!//moneyTypes(rawValue: tU)
        
        //print(toUnit.get(val: toValue))
        switch toUnit {
        case .Euro:
            euroConversion(fromUnit)
        case .Peso:
            pesoConversion(fromUnit)
        case .USD:
            usdConversion(fromUnit)
        }
         
    }
    
    func euroConversion(_ fromUnit:moneyTypes){
        //conversion to euro from fromUnit moneyType
        switch fromUnit {
        case .Peso:
            toValue = fromValue * 0.046
        case .USD:
            toValue = fromValue * 0.88
        case .Euro:
            toValue = fromValue
        }
    }
    func pesoConversion(_ fromUnit:moneyTypes){
        switch fromUnit{
        case .USD:
            toValue = fromValue * 19.07
        case .Euro:
            toValue = fromValue * 21.62
        case .Peso:
            toValue = fromValue
        }
    }
    func usdConversion(_ fromUnit:moneyTypes){
        switch fromUnit{
        case .Euro:
            toValue = fromValue * 1.13
        case .Peso:
            toValue = fromValue * 0.052
        case .USD:
            toValue = fromValue
        }
    }
    
    
    
    /*============================END money Conversions==========================*/
    func distanceConversion(from fU:Int, to tU:Int){
        let toUnit:distanceTypes = distanceTypes(rawValue: tU)!
        let fromUnit:distanceTypes = distanceTypes(rawValue: fU)!//moneyTypes(rawValue: tU)
        
        //print(toUnit.get(val: toValue))
        switch toUnit {
        case .meter:
            meterConversion(fromUnit)
        case .centi:
            centiConversion(fromUnit)
        case .kilo:
            kiloConversion(fromUnit)
        case .milli:
            milliConversion(fromUnit)
        case .inch:
            inchConversion(fromUnit)
        case .foot:
            footConversion(fromUnit)
        case .yard:
            yardConversion(fromUnit)
        case .mile:
            mileConversion(fromUnit)
        }
    }
    
    func meterConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.01
        case .kilo:
            toValue = fromValue * 1000
        case .milli:
            toValue = fromValue * 0.001
        case .inch:
            toValue = fromValue * 0.0254
        case .foot:
            toValue = fromValue * 0.3048
        case .yard:
            toValue = fromValue * 0.9144
        case .mile:
            toValue = fromValue * 1609.34
        case .meter:
            toValue = fromValue
        }
    
    }
    func centiConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue
        case .kilo:
            toValue = fromValue * 100000
        case .milli:
            toValue = fromValue * 0.1
        case .inch:
            toValue = fromValue * 2.54
        case .foot:
            toValue = fromValue * 30.48
        case .yard:
            toValue = fromValue * 91.44
        case .mile:
            toValue = fromValue * 160934
        case .meter:
            toValue = fromValue * 100
        }
    }
    func milliConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue / 100
        case .kilo:
            toValue = fromValue * 1000000
        case .milli:
            toValue = fromValue
        case .inch:
            toValue = fromValue * 25.4
        case .foot:
            toValue = fromValue * 304.8
        case .yard:
            toValue = fromValue * 914.4
        case .mile:
            toValue = fromValue * 1609340
        case .meter:
            toValue = fromValue * 1000
        }
    }
    func kiloConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.00001
        case .kilo:
            toValue = fromValue
        case .milli:
            toValue = fromValue * 0.000001
        case .inch:
            toValue = fromValue * 0.0000254
        case .foot:
            toValue = fromValue * 0.0003048
        case .yard:
            toValue = fromValue * 0.0009144
        case .mile:
            toValue = fromValue * 1.60934
        case .meter:
            toValue = fromValue * 0.001
        }
    }
    func inchConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.393701
        case .kilo:
            toValue = fromValue * 39370.1
        case .milli:
            toValue = fromValue * 0.0393701
        case .inch:
            toValue = fromValue
        case .foot:
            toValue = fromValue * 12
        case .yard:
            toValue = fromValue * 36
        case .mile:
            toValue = fromValue * 63360
        case .meter:
            toValue = fromValue * 39.3701
        }
    }
    func footConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.0328084
        case .kilo:
            toValue = fromValue * 3280.84
        case .milli:
            toValue = fromValue * 0.00328084
        case .inch:
            toValue = fromValue / 12
        case .foot:
            toValue = fromValue
        case .yard:
            toValue = fromValue * 3
        case .mile:
            toValue = fromValue * 5280
        case .meter:
            toValue = fromValue * 3.28084
        }
    }
    func yardConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.0109361
        case .kilo:
            toValue = fromValue * 1093.61
        case .milli:
            toValue = fromValue * 0.00109361
        case .inch:
            toValue = fromValue * 0.0277778
        case .foot:
            toValue = fromValue * 0.333333
        case .yard:
            toValue = fromValue
        case .mile:
            toValue = fromValue * 1760
        case .meter:
            toValue = fromValue * 1.09361
        }
    }
    func mileConversion(_ fromUnit:distanceTypes){
        switch fromUnit {
        case .centi:
            toValue = fromValue * 0.00000621371
        case .kilo:
            toValue = fromValue * 0.621371
        case .milli:
            toValue = fromValue * 0.000000621371
        case .inch:
            toValue = fromValue * 0.0000157828
        case .foot:
            toValue = fromValue * 0.000189394
        case .yard:
            toValue = fromValue * 0.000568182
        case .mile:
            toValue = fromValue
        case .meter:
            toValue = fromValue * 0.000621371
        }
    }
    
    
    /*===================END Distance conversions==========================*/
    func speedConversion(from fU:Int, to tU:Int){
        let toUnit:speedTypes = speedTypes(rawValue: tU)!
        let fromUnit:speedTypes = speedTypes(rawValue: fU)!//moneyTypes(rawValue: tU)
        
        //print(toUnit.get(val: toValue))
        switch toUnit {
        case .MPH:
            mphConversion(fromUnit)
        case .KPH:
            kphConversion(fromUnit)
        }
    }
    
    func mphConversion(_ fromUnit:speedTypes) {
        switch fromUnit {
        case .KPH:
            toValue = fromValue * 0.621371
        case .MPH:
            toValue = fromValue
        }
    }
    func kphConversion(_ fromUnit:speedTypes) {
        switch fromUnit {
        case .KPH:
            toValue = fromValue
        case .MPH:
            toValue = fromValue * 1.60934
        }
    }
    
    
    /*=====================END speed Conversions============================*/
    func tempConversion(from fU:Int, to tU:Int){
        let toUnit:tempTypes = tempTypes(rawValue: tU)!
        let fromUnit:tempTypes = tempTypes(rawValue: fU)!//moneyTypes(rawValue: tU)
        
        //print(toUnit.get(val: toValue))
        switch toUnit {
        case .kelvin:
            kelvinConversion(fromUnit)
        case .fareheit:
            farenheitConversion(fromUnit)
        case .celcius:
            celciusConversion(fromUnit)
        }
    }
    
    func kelvinConversion(_ fromUnit:tempTypes) {
        switch fromUnit {
        case .celcius:
            toValue = fromValue + 273.15
        case .fareheit:
            toValue = ((fromValue-32) * 5/9) - 273.15
        case .kelvin:
            toValue = fromValue
        }
    }
    func celciusConversion(_ fromUnit:tempTypes) {
        switch fromUnit {
        case .celcius:
            toValue = fromValue - 273.15
        case .fareheit:
            toValue = (fromValue-32) * 5/9
        case .kelvin:
            toValue = fromValue
        }
    }
    func farenheitConversion(_ fromUnit:tempTypes) {
        switch fromUnit {
        case .celcius:
            toValue = (fromValue * 9/5) + 32
        case .fareheit:
            toValue = fromValue
        case .kelvin:
            toValue = (fromValue * 9/5) - 459.67
        }
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
