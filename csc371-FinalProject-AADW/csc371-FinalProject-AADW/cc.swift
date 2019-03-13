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

class calculator : cc{
    var type: sect
    var name:String
    let id:String
    
    enum cellIdentifier : String {
        case basic = "basic"
        case scientific = "scientific"
        case hex = "hex"
    }
    
    required init(name: String, type: sect, id:cellIdentifier) {
        self.id = id.rawValue
        self.name = name
        self.type = type
    }
    
    
}

class conversion : cc{
    var type: sect
    var name:String
    let id:String
    
    enum cellIdentifier : String{
        case usd
    }
    required init(name: String, type: sect, id:cellIdentifier) {
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
    conversion(name: "UsDollars", type: .conversion, id: .usd)
]
