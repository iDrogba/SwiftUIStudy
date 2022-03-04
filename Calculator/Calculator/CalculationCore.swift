//
//  CalculationLogic.swift
//  Calculator
//
//  Created by 김상현 on 2022/03/04.
//

import Foundation

class CalculationCore {
    
    var digit1 : Double? = nil
    var digit2 : Double? = nil
    var symbol : String? = nil
    var calculateResult : Double? = nil
    
    func logic() -> Double? {
        switch symbol {
            
        case "+":
            calculateResult = digit1! + digit2!
            
        case "-":
            calculateResult = digit1! - digit2!
            
        case "+-":
            calculateResult = -digit1!
            
        case "%":
            calculateResult = digit1! * 0.01
            
        default:
            break
        }
        
        return calculateResult
    }
}
