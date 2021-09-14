//
//  Karatsuba.swift
//  Karatsuba
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}


// Karatsuba Multiplication
func karatsuba(_ num1: Int, by num2: Int) -> Int {
    let num1Array = String(num1)
    let num2Array = String(num2)
    
    guard num1Array.count > 1 && num2Array.count > 1 else {
        return num1*num2
    }
    
    let n = max(num1Array.count, num2Array.count)
    let nBy2 = n / 2
    
    let a = num1 / 10^^nBy2
    let b = num1 % 10^^nBy2
    let c = num2 / 10^^nBy2
    let d = num2 % 10^^nBy2
    
    let ac = karatsuba(a, by: c)
    let bd = karatsuba(b, by: d)
    let adPlusbc = karatsuba(a+b, by: c+d) - ac - bd
    
    let product = ac * 10^^(2 * nBy2) + adPlusbc * 10^^nBy2 + bd
    
    return product
}

