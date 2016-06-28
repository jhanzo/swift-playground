import Foundation

//: PROTOCOL

//Classes, enums and structs can all adopt protocols

protocol SimpleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass : SimpleProtocol{
    var simpleDescription = "Simple Class"
    
    //don't need mutating because of class always modify class
    func adjust() {
        simpleDescription += ". Additional"
    }
}

//:STRUCTURE

struct SimpleStructure : SimpleProtocol {
    var simpleDescription: String = "Simple Structure"
    
    //need mutating because of structure can't natively modify structure
    mutating func adjust() {
        simpleDescription += " (adjusted)."
    }
}

//:EXTENSION

//add extension for having new methods or properties for # types #
extension Int : SimpleProtocol{
    var simpleDescription: String{
        return "the number is \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

//print(7.simpleDescription)

//protocol can be instantiated in a variable where you have a list object of unknown class but known protocol
//let protocolValue: SimpleProtocol = a
//print (protocolValue.simpleDescription)