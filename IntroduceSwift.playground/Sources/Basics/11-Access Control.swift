import Foundation

//restrict access to parts of your code from another source files

//for a single app target, access control is implicit

//public
//internal (for ex: fw structure) (by default)
//private (source file only)

//so be carreful how source file is composed for avoiding to have private object not accessible (ex: class and protocol in different file)

//@testable
//can be used in unit test targets
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}