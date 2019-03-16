//
//  cc.swift
//  csc371-FinalProject-AADW
//
//  Created by DeAngelo Deshawn Wilson on 3/12/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import Foundation

//either a calculator or a conversion
enum sect {
    case calculator
    case conversion
}

protocol cc {
    var name:String{get}
    var type:sect{get}
    var id:String{get}
    
}

enum calcIdentifier : String {
    case basic = "basic"
    case scientific = "scientific"
    case hex = "hex"
}

class calculator : cc{
    var type: sect
    var name:String
    let id:String
    
    
    required init(name: String, type: sect, id:calcIdentifier) {
        self.id = id.rawValue
        self.name = name
        self.type = type
    }
    
    
}
enum conversionIdentifier : String{
    case money = "money"
    case distance = "distance"
    case speed = "speed"
    case temperature = "temp"
}
class conversion : cc{
    var type: sect
    var name:String
    let id:String
    
    required init(name: String, type: sect, id:conversionIdentifier) {
        self.id = id.rawValue
        self.name = name
        self.type = type
    }

    
    
}

let calculatorsList = [
    calculator(name: "Basic Calculator", type: .calculator, id: .basic),
    calculator(name: "Scientific Calculator", type: .calculator, id: .scientific),
    calculator(name: "Hexadecimal Calculator", type: .calculator, id: .hex)
]

let conversionsList = [
    conversion(name: "Money Conversions", type: .conversion, id: .money),
    conversion(name: "Distance Conversions", type: .conversion, id: .distance),
    conversion(name: "Speed Conversions", type: .conversion, id: .speed),
    conversion(name: "Temperature Conversions", type: .conversion, id: .temperature)
]
