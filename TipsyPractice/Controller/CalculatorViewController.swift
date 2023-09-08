//
//  ViewController.swift
//  TipsyPractice
//
//  Created by jae hoon lee on 2023/09/06.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tipPct : Float = 0.0
    var select : String = ""
    var stepperValue : Int = 0
    var billValue : Float = 0.0
    var totalPerPerson : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billTextField.keyboardType = UIKeyboardType.decimalPad
    }
    
    @IBAction func enterTotalBill(_ sender: UITextField) {
        billValue = Float(billTextField.text!) ?? 0.0
        
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        select = sender.currentTitle!
        switch select {
        case "0%" :
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%" :
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "20%" :
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        default :
            print("wrong select")
            // 선택하는 방법 다른버전
//            billTextField.endEditing(true)
//
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//            sender.isSelected = true
            
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
        splitNumberLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        switch select {
        case "0%" :
            tipPct = 1.0
        case "10%" :
            tipPct = 1.1
        case "20%" :
            tipPct = 1.2
        default :
            print("wrong select")
        }
        let totalPerPerson = (Float(tipPct) * billValue) / Float(stepperValue)
        self.performSegue(withIdentifier: "goToResult", sender: totalPerPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            if let destinationVC = segue.destination as? ResultsViewController {
                if let totalPerPerson = sender as? Float {
                    destinationVC.totalPerPerson = totalPerPerson
                }
                destinationVC.resultPeople = stepperValue
                destinationVC.resultTips = select
            }
        }
    }
    
    
    
    
}

