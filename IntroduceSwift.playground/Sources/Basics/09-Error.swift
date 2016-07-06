import Foundation

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

//throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

//disabling error propagation
//let photo = try! loadImage("./Resources/John Appleseed.jpg")