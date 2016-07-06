import Foundation

class Persona {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
/*
var ref1: Persona?
var ref2: Persona?
var ref3: Persona?

ref1 = Persona(name:"Paul")
ref2 = ref1
ref3 = ref1
//there are 3 strong references

ref1 = nil
ref2 = nil
//ARC does not deallocate Persona until final strong reference is broken
ref3 = nil
//it prints "Paul is being deinitialized"
*/

//ARC automatically deallocated when an instance is nos longer needed
//how to avoid cycles ?
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
/*
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil
 */

//The strong references between the Person instance and the Apartment instance remain and cannot be broken

//SOLUTION : WEAK & UNOWNED
//weak reference does not keep a stronge hold on the instance it refers to
//if the reference always have a value, unowned should be used
//ARC automatically sets a weak reference to nil
//Lazy

//For ex, if you have a Person class and a personalizedGreeting property
//The personalizedGreeting property can be lazily instantiated 
//after the object is created so it can contain the name of the person
class Personi {
    var name: String
    lazy var personalizedGreeting: String = {
        [unowned self] in
        return "Hello, \(self.name)!"
    }()
    
    init(name: String) {
        self.name = name
    }
}