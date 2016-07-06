import Foundation

//Type properties
//static is a keyword for defining ref variables
//it hasn't any getter nor setter

//Methods
//should be written with a preposition for being read as a sentence (ex: incrementBy)
//incrementBy(_:numberOfTimes:)

class SomeClass {
    //override method of superclass
    class func someTypeMethod() {
    }
}

//Type methods
class Math {
    class func absoluteValueOf(value: Int) -> Int {
        if value < 0 {
            return (-value)
        } else {
            return value
        }
    }
}

struct MathStruct {
    static func absoluteValueOf(value: Int) -> Int {
        if value < 0 {
            return (-value)
        } else {
            return value
        }
    }
}

let referenceTypeAnswer =       Math.absoluteValueOf(-5)
let valueTypeAnswer     = MathStruct.absoluteValueOf(-5)