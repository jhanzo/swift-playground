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
    //same for enums
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

//Protocols can be used as types

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...3 {
//    print("Random dice roll is \(d6.roll())")
//}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4

//protocol can be limited to class by specifying "class" ketword
//ex: protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {}

//optional keyword van be specified before a type
//it needs @objc before "protocol" keyword
//struct and enum can't use it
//all inherit classes of objc protocol should have objc keyword before class keyword

//constraints can be added to protocol definition with "where" clause
/*
 extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}
 */