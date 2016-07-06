import Foundation

//inout for updating param of functions

func sumFonction(first:Int,_ second:Int) -> Int{return first + second}
//someFonction(1, 2)

func sayHello(to onePerson:String,and anotherPerson:String)->String{
    return "Hello \(onePerson) and \(anotherPerson)"
}
//sayHello(to: "Me", and: "You")

func sumNumbers(numbers:Double...)->Double{
    var total :Double = 0
    for number in numbers {total = total + number}
    return total
}
//sumNumbers(1,2,3,4)

func swapTwoPoints(inout a: Int, inout _ b: Int){
    let tmp = b
    b = a
    a = tmp
}
var intA = 10
var intB = 11
//swapTwoPoints(&intA, &intB)

var varSumFunction: (Int,Int) -> Int = sumFonction
//print("Result: \(varSumFunction(1,1))")
//prints 2

//: CLOSURES

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversed1 = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//is equivalent to
var reversed2 = names.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//is equivalent to
var reversed3 = names.sort( { s1, s2 in return s1 > s2 } )
//is equivalent to
var reversed4 = names.sort( { s1, s2 in s1 > s2 } )
//is equivalent to
var reversed5 = names.sort( { $0 > $1 } )
//is equivalent to
var reversed6 = names.sort(>)

//if a closure is a parameter of a function,
//@noescape let closure called after the function returns

//autoescape
var customers = names
//print(customers.count)
//prints 5
let customerProvided = { customers.removeAtIndex(0) }
//print(customers.count)
//prints 5
//print(\customerProvided())
//prints Chris
//print(customers.count)
//prints 4

//autoclosure lets delay evaluation
//because the code inside isn't run until closure is called

//following does exactly the same thing...
//but with explicit closure
func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
//serveCustomer({customers.removeAtIndex(0)})

//thanks to autoclosure you can call serveCustomer as if parameter was String
//with @autoclosure @noescape is implicite
//@autoclosure(escaping) is possible
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
//serveCustomer(customers.removeAtIndex(0))

//defer
/*
func writeLog() {
    let file = openFile()
    
    let hardwareStatus = fetchHardwareStatus()
    guard hardwareStatus != "disaster" else { return }
    file.write(hardwareStatus)
    
    let softwareStatus = fetchSoftwareStatus()
    guard softwareStatus != "disaster" else { return }
    file.write(softwareStatus)
    
    let networkStatus = fetchNetworkStatus()
    guard neworkStatus != "disaster" else { return }
    file.write(networkStatus)
    
    closeFile(file)
}

func writeLog() {
    let file = openFile()
    defer { closeFile(file) }
    
    let hardwareStatus = fetchHardwareStatus()
    guard hardwareStatus != "disaster" else { return }
    file.write(hardwareStatus)
    
    let softwareStatus = fetchSoftwareStatus()
    guard softwareStatus != "disaster" else { return }
    file.write(softwareStatus)
    
    let networkStatus = fetchNetworkStatus()
    guard neworkStatus != "disaster" else { return }
    file.write(networkStatus)
}
*/
