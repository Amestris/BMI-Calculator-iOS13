//
//  CalculatorModel.swift
//  BMI Calculator
//
//  Created by Ewelina on 14/12/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//


import UIKit

struct CalculatorModel{
    
    var bmi: BMI?
    
    func getBMIString() -> String{
        let getBMITo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return getBMITo1Decimal
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
    func getColour() -> UIColor{
        return  bmi?.color ?? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    mutating func calculateBMI(_ weight: Float,_ height: Float){
        
        let bmiValue = weight / pow(height, 2)
        let adviceTxt: String
        let colorByAdvice: UIColor
        
            
        
        switch bmiValue {
        case 1..<18.5:
             adviceTxt = "Underweight"
            colorByAdvice = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case 18.5..<24.9:
             adviceTxt = "Normal"
            colorByAdvice = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        default:
             adviceTxt = "Overweight"
            colorByAdvice = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            
        }


        bmi = BMI(value: bmiValue, advice: adviceTxt, color: colorByAdvice)
        
        
    }
    
}
