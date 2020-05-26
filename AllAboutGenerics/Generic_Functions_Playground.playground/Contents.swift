import Cocoa

func  swapInts  (a:  inout  Int,b:  inout  Int)  {
    let  tmp  =  a
    a  =  b
    b  =  tmp
}

func  swapDoubles(a:  inout  Double,b:  inout  Double)  {
    let  tmp  =  a
    a  =  b
    
    
    b  =  tmp
}

func  swapStrings(a:  inout  String,  b:  inout  String)  {
    let  tmp  =  a
    a  =  b
    b  =  tmp
}

// MARK: generic functions
//we can use generics instead of the above duplicate code
func  swapGeneric<T>(a:  inout  T,  b:  inout  T)  {
    let  tmp  =  a
    a  =  b
    b  =  tmp
}

var  a  =  5
var  b  =  10
swapGeneric(a:  &a,  b:  &b)
print("a:  \(a)  b:  \(b)")


var  c  =  "My  String  1"
var  d  =  "My  String  2"
swapGeneric(a:  &c,  b:  &d)
print("c:\(c)  d:\(d)")

// MARK: generic constraints
 
//A type constraint specifies that a generic type must inherit from a specific class or conform to a particular protocol. This allows us to use the methods or properties defined by the parent class or protocol with the generic types
func  testGenericComparable<T:  Comparable>(a:  T,  b:  T)  ->  Bool{
    return  a  ==  b
}


//We can declare multiple constraints, just like we can declare multiple generic types. The following example shows us how to declare two generic types with different constraints:
   func testFunction<T: MyClass, E: MyProtocol>(a: T, b: E) {
   }
//In this function, the type defined by the T placeholder must inherit from the MyClass class, and the type defined by the E placeholder must implement the MyProtocol protocol. Now that we have looked at generic functions and type constraints, let's look at generic types.
