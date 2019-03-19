//
//  ScientificCalculatorViewController.swift
//  csc371-FinalProject-AADW
//
//  Created by Amine Aboufariss on 3/12/19.
//  Copyright © 2019 DeAngelo Deshawn Wilson. All rights reserved.
//

import UIKit



class ScientificCalculatorViewController: UIViewController {

    @IBOutlet weak var calcLabel: UILabel!

    
    @IBAction func textButtonPressed(_ sender: UIButton){
        if let btnLabel = sender.titleLabel?.text{
            calcLabel.text?.append(btnLabel)
        }
        //calcLabel.text! = "\(calcLabel.text!)\(sender.titleLabel!.text ?? "" )"
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        guard let txtAction = sender.titleLabel?.text else {return}
        switch txtAction {
        case "=":
            reduceEqual()
        case "n!":
            nFactorial()
        case "√":
            squareRoot()
        case "⌫":
            backSpace()
        case "C":
            clearLabel()
        case "CE":
            clearLabel()
        default:
            break
        }
        
    
        
        
        
    }
    
    func reduceEqual(){
        //simplifying whats in parentheses
        guard let txt = calcLabel.text else {return}
        var parenthesesStack = Stack<String>();
        var expressionStack = Stack<String>();
        var simplifiedExpression:String = ""
        
        expressionStack.push("")
        
        for char in txt{
            if(char == "(" ){
                parenthesesStack.push(char.description) //Push "("
                expressionStack.push("")//adds a stack for a new expression
            }
            if(char == ")"){
                if(parenthesesStack.top == "("){
                    //This means expression in stack can be evaluated since whatever is inbetween is closed off
                    simplifiedExpression = simplifiedExpression + simpleEqual(expressionStack.pop() ?? "").description
                    parenthesesStack.pop() //I know its unused i dont want it
                    
                }
                else{
                    parenthesesStack.push(")")
                }
            }
            else{
                expressionStack.addToTop(char.description)
            }
        }
        
        while(expressionStack.count >= 1){
            simplifiedExpression = simplifiedExpression + simpleEqual(expressionStack.pop() ?? "").description
        }
        calcLabel.text = simplifiedExpression
    }
    
    func simpleEqual(_ s: String) -> Double {
        //mult,divide,add,subtract
        var numbers = Stack<String>(); //56+5*55-4/3
        var operators = Stack<String>()
        
        var str : String = s
        print("str: ", str)
        
        numbers.push("")
        
        for char in str{
            if(numbers.count>3){
                let tempOp:String = operators.pop()!
                let n2 = numbers.pop()
                let n1 = numbers.pop()
                
                print("n1:",n1!)
                print(tempOp)
                print("n2:",n2!)
                
                str = str + String(simplestEqual(n1!, n2!, tempOp))
                operators.push(char.description)
                
            }
                //   division     multiplication   addition     subtraction
            if(char == "÷" || char == "×" || char == "+" || char == "-"){
                //print(char.description)
                operators.push(char.description)
                numbers.push("")
            }
            else{
                numbers.addToTop(char.description)
                print("char.descripion: ", char.description)
            }
        }
        
        if(numbers.count>1){
            let tempOp:String = operators.pop()!
            let n2 = numbers.pop()
            let n1 = numbers.pop()
            print("n1:",n1!)
            print(tempOp)
            print("n2:",n2!)
            str = str + String(simplestEqual(n1!, n2!, tempOp))
        }
        
        print("str at end: ", str)
       
        if (str == nil ){
            return 0
        }
        else{
            return Double(str) ?? 0
        }
    }
    
    func simplestEqual(_ n1:String, _ n2:String, _ op:String)->Double{
        switch op {
        case "×":
            return Double(n1)! * Double(n2)!
        case "÷":
            return Double(n1)! / Double(n2)!
        case "+":
            return Double(n1)! + Double(n2)!
        case "-":
            return Double(n1)! - Double(n2)!
        
        default:
            return 0
        }
    }
    
    func nFactorial(){
        
    }
    func squareRoot(){
        
    }
    func backSpace(){
        
    }
    func clearLabel(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcLabel.text = ""
        // Do any additional setup after loading the view.
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

public struct Stack<String> {
    fileprivate var array = [String]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: String) {
        array.append(element)
    }
    
    public mutating func pop() -> String? {
        return array.popLast()
    }
    
    public var top: String? {
        return array.last
    }
    public mutating func addToTop(_ s:String){
        array[array.endIndex - 1] = "\(array[array.endIndex-1])\(s)" as! String
    }
}
