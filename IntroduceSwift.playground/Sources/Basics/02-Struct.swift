import Foundation

// struct and enums are value types (<>reference types)
// it means they are ALWAYS copied
// struct NEVER use ARC (like init and deinit)

//whereas classes passed by reference
//same as class def

//BUT class have more functionnalities :
// - Inheritance enables one class to inherit the characteristics of another
// - Type casting enables you to check and interpret the type of a class instance at runtime
// - Deinitializers enable an instance of a class to free up any resources it has assigned
// - Reference counting allows more than one reference to a class instance

// "Identical to" means that two constants or variables of class type refer to exactly the same class instance.
// "Equal to" means that two instances are considered “equal” or “equivalent” in value,
// for some appropriate meaning of “equal”, as defined by the type’s designer.

//In structure, when an instance of a value type is marked as a constant so are all of its properties
//don't true for classes

//for updating a value of struct in func "mutating" keyword is mandatory

//lazy is used in a class when it depends on instance of another class
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
// the DataImporter instance for the importer property has not yet been created
//print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created

//computed properties let not storing value but having getter and setter
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        //equivalent to
        /*
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
         */
    }
    
    /*
    var width = 0.0, height = 0.0, depth = 0.0
    //without setter means read only var
    var volume: Double {
        return width * height * depth
    }
     */
    
    //willSet and didSet can be done for logging message
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                      size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
//square.center = Point(x: 15.0, y: 15.0)
//print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)