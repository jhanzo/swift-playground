import Foundation

//prefix / infix / postfix keyword
//before / between / after
prefix func - (param: String) -> String {
    return "minus " + param
}

//associativity = left / right / none
//precedence is for priority (ex: (a - b) * c)
infix operator +- { associativity left precedence 140 }

//operators
//https://developer.apple.com/library/tvos/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html

//declare new operator
prefix operator +++ {}
//inout for mutating
prefix func +++ (inout param: Int) -> Int {
    param += param
    return param
}
