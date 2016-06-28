import Foundation

public class FirstClass {
    var cpt = 0
    let imutableCpt = 100
    var resString = ""
    
    var doubleCpt : Int{
        //get{return 2 * self.cpt}
        //note usage of keyword newValue
        //set{self.cpt = newValue / 2}
        //subscripts
        //outside the initialisation set
        willSet{self.resString += "Old doubleCpt is : \(self.doubleCpt)"}
        didSet{self.resString += " ; New doubleCpt is : \(self.doubleCpt)"}
    }
    
    public init(cpt:Int,res:String){
        self.cpt = cpt
        self.resString = res;
        self.doubleCpt = 2*cpt;
    }
    
    func simpleDescription() -> String {
        return "Cpt is : \(cpt)"
    }
    
    func addNumberTo(addNumber:Int) -> Int{
        return imutableCpt + addNumber
    }
}

var firstClass0 = FirstClass(cpt:10,res:"")
//if value before ? is nil already after is ignored
var firstClass1 : FirstClass? = FirstClass(cpt:10,res:"")


