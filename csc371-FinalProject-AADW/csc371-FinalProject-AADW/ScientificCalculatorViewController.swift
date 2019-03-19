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
   
    enum action : String{
        case addition = "+"
        case subtraction = "-"
        case multiplication = "*"
        case division = "/"
    }
    var actions : [action]?
    
    @IBAction func textButtonPressed(_ sender: UIButton) {
        calcLabel.text! = "\(calcLabel.text!)\(sender.titleLabel!.text ?? "" )"
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        
        
        
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
