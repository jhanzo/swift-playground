import Foundation

//write a name in angle brackets for creating a generic
//functions/enums/structures

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas

func generericMethod<Item>(item:Item) -> [Item]{
    var result = [Item]()
    for _ in 0..<5{
        result.append(item)
    }
    return result
}

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

//anyCommonElements([1, 2, 3], [3])

//class, struct and enum can use generics
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

//constraints can be addded in this way
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {}

//associated types
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

