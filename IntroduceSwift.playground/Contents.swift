//: Playground - noun: a place where people can play

import UIKit

//
//:BASICS
//

//print something
print ("Some swift tips")
//look at the \n at the end automatically added

//to specify type is not mandatory when value is not nil
var mutableVar = "test"
mutableVar = String(12)
let immutableVar1 = "My mutable var is " + mutableVar
let immutableVar2 = "My mutable var is \(mutableVar)"

//specify a value or a type annotation or both
var mVar: String = "mVar"
var var1,var2,var3:String
let 🤔😡 = "WTF ?!" ; print(🤔😡, separator: "", terminator: "\n")


var array = ["data1","data2","data3"]
print (array[0])
var dictionnnary1 = ["col1":"data1","col2":"data2"]
//you can mix up different types of datas
var dictionnnary2 = ["col1":[1,1,2],"col2":["string1","string2"]]
dictionnnary1["col3"] = "data3"
//you can print whatever you want without to specify object type
print(dictionnnary1)

let newArray1 = []
let newArray2 = [String]()
let newDict1 = [:]
let newDict2 = [Float:String]()
//note parenthesis when type is specified

//if ... no demo needed

//optional values
var nilString: String? = nil
var optionalString: String? = "string"
print(optionalString == nil)
//for being compared with nil value, optional are required '?' = can be nil '!' = cannot be nil

if let optVar = optionalString{
    print("not nil")
}

let informalGreeting = "Hi \(nilString ?? optionalString)"

let vegetable = "red pepper"
//don't need to break case clause
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    //default is mandatory
    default:
        print("Everything tastes good in soup.")
}

//do ...while = repeat ...while in swift

var total = 0
for i in 0..<4 {total += 1}
//4

total = 0
for i in 0...4 {total += 1}
//5

//
//:FUNCTIONS
//

func function(param1:String,param2:Int) -> String{
    return "return string value"
}

//you can return a tuple...
func testFunction(param1:String,param2:Int) -> (return1:String,return2:Float){
    return ("return string value",2.0)
}
let value = testFunction("test", param2: 0)

//function can return function...
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//function are nested
var y = 12
func add() -> Int{
    //outer var can be called in function
    return y + 1
}
add()
//outer var after nested function is not updated
print (y)

//function can be parameter of a function

var numbers = [20,39,7,22]
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//more concisely...
let mappedNumbers = numbers.map({ number in 3 * number })
let sortedNumbers = numbers.sort { $0 > $1 }

func canThrowAnError() throws {
    print("throw !")
}

do{
    try canThrowAnError()
}
//multiple errors can be caught
catch {
    
}

var testValue : String?	= "test"
testValue = nil
print (testValue)
//nil in OBJ C is a pointer to an non existing object

if let first = Int("4"),second = Int("42") where first < second{
    print ("OK")
}

//try to change "<" to ">"
assert(Int("0") < 10,"Zero can't be sup to Ten !!")

//assignment does not return a value whereas c and obj c do
//nil coalescing operator
//a ?? b
//a != nil ? a! : b

//3 different types of swift collections :
//array
//set
//  intersect
//  exclusiveOr
//  union
//  substract
//  isSubsetOf
//  isSuperSubsetOf
//dictionnary

//guard as assert but do something else than only crash
func checkSavage(savage:String?){
    guard let name = savage else {return}
    print(name)
}
//fallthrough instead of break (or no keyword) for going to other cases

if #available(iOS 9, OSX 10.10, *) {
    print("available")
}