//
//  BasicCalculatorViewController.swift
//  csc371-FinalProject-AADW
//
//  Created by DeAngelo Deshawn Wilson on 3/6/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import UIKit

class BasicCalculatorViewController: UIViewController {
    
    
    enum operations : String{
        case addition = "+"
        case subtraction = "-"
        case multiplication = "*"
        case division = "/"
    }

    var o:operations?
    var left:Double?
    var right:Double?
    var result:Double=0

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var equalsBtn: UIButton!
    @IBOutlet weak var multiBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    
    @IBOutlet var numBtns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clear(_ sender: UIButton) {
        result = 0
        resultLabel.text = "0"
        left = nil
        right = nil
        resetlabel = true
        
    }
    var resetlabel = true
    //operatioj function, must take care of previous value, stored in resultLabel
    @IBAction func op(_ sender: UIButton) {
        //store resultLabel num into equation
        guard let str = resultLabel.text else {return}
        guard let num = Double(str) else{return}
        left = num
        
        guard let label = sender.titleLabel?.text else {return}
        switch label {
        case "+":
            o = .addition
        case "-":
            o = .subtraction
        case "*":
            o = .multiplication
        case "/":
            o = .division
        default:
            break
        }
        resetlabel=true
        //resultLabel.text = ""
    }
    
    @IBAction func number(_ sender: UIButton) {
        if let numStr = sender.titleLabel?.text{
            switch(resetlabel){
            case true:
                resultLabel.text? = numStr
                resetlabel=false
            default:
                resultLabel.text?.append(numStr)
            }
        }
    }
    
    @IBAction func equals(_ sender: UIButton) {
        guard let l = left else {return}
        if let r = Double(resultLabel.text!){
            right=r
            if let operation = o{
                switch operation{
                case .addition:
                    result = add(pre: l, cur: r)
                case .subtraction:
                    result = sub(pre: l, cur: r)
                case .multiplication:
                    result = multiplication(pre: l, cur: r)
                case .division:
                    result = division(pre: l, cur: r)
                /*
                default:
                    break
                */
                }
            }

        }
        left = nil
        //right = nil
        resultLabel.text = String(format: "%d", (intCheck(d: result)) ? Int(result): result)// result)
    }
    
    func intCheck(d:Double) -> Bool {
        //let disp:Double = floor(d)
        return (d-floor(d)==0) ? true : false
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        
    }
    */
    func add (pre:Double, cur:Double) -> Double {
        return pre+cur
    }
    func sub (pre:Double, cur:Double) -> Double {
        return pre-cur
    }
    func multiplication(pre:Double, cur:Double) -> Double {
        return pre*cur
    }
    func division(pre:Double, cur:Double) -> Double {
        return pre/cur
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
