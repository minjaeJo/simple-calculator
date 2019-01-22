//
//  CalculatorModel.swift
//  SimpleCalculator
//
//  Created by minjae on 22/01/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var accumulator: Double = 0
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    private var operation: Dictionary<String,Operation> = [
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "=" : Operation.Equals
    ]
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
    }
    
    private var pending: PendingBinaryOperationInfo?
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        if let operation = operation[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                excutePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                excutePendingBinaryOperation()
            }
        }
    }
    private func excutePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    var result: Double {
        get {
            return accumulator
        }
    }
}
