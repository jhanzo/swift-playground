import Foundation

//write a name in angle brackets for creating a generic
//functions/enums/structures

func genereric<Item>(item:Item) -> [Item]{
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