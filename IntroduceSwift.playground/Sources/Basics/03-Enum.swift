import Foundation

//enum is named with singular for being more readable

//enum type can be Int/String/Float
public enum Rank:Int{
    case One = 1
    case Two, Three, Four, Five
    case abc,def,ghi
    
    public func simpleDescription()->String{
        switch self {
        case .One:
            return "one"
        default:
            return String(self.rawValue)
        }
    }
}

let assignedRank = Rank(rawValue:3)
let assignedDescription = assignedRank?.simpleDescription()

//no raw type provided
public enum NewRank{
    //no value because of no raw type provided
    case One, Two, Three
    
    public func simpleDescription()->String{
        switch self {
        case .One:
            return "one"
        case .Two:
            return "two"
        case .Three:
            return "three"
        }
    }
}

//associated values
enum Barcode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

//raw values
enum ASCIICharacter: Character{
    case Tab = "\t"
    case BreakLine = "\n"
}
var asciiCharacter = ASCIICharacter.Tab

//implicit raw values
enum Planet:Int{
    case Mercury = 1, Venus, Earth, Mars,Jupiter,Saturn,Uranus,Neptune
}
let numberOfOurPlanet = Planet.Earth.rawValue//Int 3
let firstPlanet = Planet(rawValue:1)

enum CompassPoint:String{
    case North,South,East,West
}
let northPoint = CompassPoint.North.rawValue//String "North"

//recursive enumeration
//can use its own enum
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}