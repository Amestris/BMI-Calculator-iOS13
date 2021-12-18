//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var bmiValue = "0.0"
    var calculator = CalculatorModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        
        weightLabel.text = "\(Int(sender.value))kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculator.calculateBMI(weight, height)
        bmiValue = calculator.getBMIString()
        let bmiAdvice = calculator.getAdvice()
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultDestination = segue.destination as! ResultViewController
            resultDestination.bmiResult = calculator.getBMIString()
            resultDestination.advice = calculator.getAdvice()
            resultDestination.color = calculator.getColour()
            
        }
    }
    
    
}

