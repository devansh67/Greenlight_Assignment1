//
//  main.swift
//  Calculator
//
//  Created by Devansh Sharma on 09/01/24.
//

import Foundation

func recursiveSolve(_ num: Int, _ answer: inout Int) -> Int
{
    if num == 0
    {
        return 1
    }
    answer*=num
    return recursiveSolve(num-1,&answer)
}

func findFactorial(_ num: Int) -> Int
{
    var answer: Int = 1
    var _ = recursiveSolve(num,&answer)
    return answer
}


print("Welcome to my Calculator App\n")
var starterTextOne = """
    - Enter 1 if you would like to see the very basic version of the calculator
    - Enter 2 if you would like to evaluate an expression and find the resultant value of it
    """
print(starterTextOne)
var flag = Int(readLine()!)!
while (flag != 1) && (flag != 2)
{
    print("Please enter a valid option to proceed with your calculation\n")
    flag = Int(readLine()!)!
}
if(flag == 1)
{
    print("Welcome to the Basic calculator! Follow in-screen instructions to complete your calculation\n")
    print("Please enter the first number:-\t")
    let firstNumber = Float(readLine()!)!
    let openingStatement = """
Please enter the operator you want to use, available ones are:-
+ for Addition operation
- for Subtraction operation
* for Multiplication operation
/ for Division operation
^ for Power operation
! for Factorial operation
"""
    print(openingStatement)
    var op = readLine()!
    var outputValue: Float = 0
    if(op == "!")
    {
        outputValue = Float(findFactorial(Int(firstNumber)))
        print("Factorial of the number \(firstNumber) is \(outputValue)\n")
        exit(0)
    }
    print("Please enter the second number:-\t")
    let secondNumber = Float(readLine()!)!
    var operationName: String = ""
    switch op
    {
    case "+":
        operationName = "addition"
        outputValue = firstNumber + secondNumber
        
    case "-":
        operationName = "subtraction"
        outputValue = firstNumber - secondNumber
        
    case "*":
        operationName = "multiplication"
        outputValue = firstNumber * secondNumber
        
    case "/":
        operationName = "division"
        outputValue = firstNumber / secondNumber
        
    case "^":
        operationName = "power"
        outputValue = Float(pow(Double(firstNumber), Double(secondNumber)))
        
    default:
        let defaultText = """
        Please enter a valid operator
        + for Addition
        - for Subtraction
        * for Multiplication
        / for Division
        ^ for Power
        ! for Factorial
        """
        print(defaultText)
        op = readLine()!
    }
    
    print("The output for the \(operationName) operation between \(firstNumber) and \(secondNumber) is \(outputValue)\n")
}
else
{
    print("Welcome to the advanced calculator! Here you can type an expression and evaluate it instantly!")
    var outputValue: Float = 0
    let openingStatement = """
Please enter the any one of the following perform that operation
^ to perform the power operation
! to perform the power operation
Any other symbol/letter to perform arithmetic expression computation
"""
    print(openingStatement)
    let optionChoose = readLine()!
    if optionChoose == "^"
    {
        print("Enter a number to find power of it with another number\n")
        let firstNumber = Int(readLine()!)!
        print("Enter a number to which previous number power has to be raised to\n")
        let secondNumber = Int(readLine()!)!
        outputValue = Float(pow(Double(firstNumber),Double(secondNumber)))
        print("The power of \(firstNumber) raised to the power of \(secondNumber) is \(outputValue)")
        exit(0)
    }
    else if optionChoose == "!"
    {
        print("Enter a number to calculate factorial of it\n")
        let firstNumber = Int(readLine()!)!
        outputValue = Float(findFactorial(firstNumber))
        print("Factorial of the number \(firstNumber) is \(outputValue)\n")
        exit(0)
    }
    else
    {
        print("Please enter a mathematical expression containg addition and subtraction operations to perform computation on it\n")
        let mathExpression = readLine()!
        var listOne: [Character] = []
        for char in mathExpression
        {
            listOne.append(char)
        }
        var listTwo: [Float] = []
        var outputValue: Float = 0
        var operationPerformed:Float  = 1
        var i = 0
        let lengthExpression = mathExpression.count
        while i < lengthExpression
        {
            if listOne[i].isNumber
            {
                var num: Float = 0
                while (i < lengthExpression) && (listOne[i].isNumber)
                {
                    num = num * 10 + Float(listOne[i].wholeNumberValue!)
                    i += 1
                }
                outputValue += operationPerformed * num
                i -= 1
            }
            else if listOne[i] == "+"
            {
                operationPerformed = 1
            }
            else if listOne[i] == "-"
            {
                operationPerformed = -1
            }
            else if listOne[i] == "("
            {
                listTwo.append(outputValue)
                listTwo.append(operationPerformed)
                outputValue = 0
                operationPerformed = 1
            }
            else if listOne[i] == ")"
            {
                outputValue *= listTwo.popLast()!
                outputValue += listTwo.popLast()!
            }
            else
            {
                print("Invalid mathematical expression has been entered here which lead to this error\n")
                exit(0)
            }
            i += 1
        }
        print("Answer of the computation of the mathematical expression is:-\t \(outputValue)")
    }
}
