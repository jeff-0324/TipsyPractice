//
//  ResultsViewController.swift
//  TipsyPractice
//
//  Created by jae hoon lee on 2023/09/07.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson : Float = 0.0
    var resultPeople : Int = 0
    var resultTips : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setup()
    }
    
    func setup() {
        totalLabel.text = String(totalPerPerson)
        settingsLabel.text = "Split between \(resultPeople) people, with \(resultTips) tip"
    }
    
   
    @IBAction func recalculateTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        
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
