//
//  Multiply.swift
//  Multiply
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

func multiply(_ num1: String, by num2: String, base: Int = 10) -> String {
    let num1Array = num1.reversed().map{ Int(String($0))! }
    let num2Array = num2.reversed().map{ Int(String($0))! }
    
    var product = Array(repeating: 0, count: num1Array.count + num2Array.count)
    
    for i in num1Array.indices {
        var carry = 0
        for j in num2Array.indices {
            product[i + j] += carry + num1Array[i] * num2Array[j]
            carry = product[i + j] / base
            product[i + j] %= base
        }
        product[i + num2Array.count] += carry
    }
    
    return product.reversed().map{ String($0) }.reduce("", +)
}
