import Cocoa

struct  List<T>  {
    var  items  =  [T]()
    
    mutating  func  add(item:  T)  {
        items.append(item)
    }
    //we don't need to specify type since our classa already did
    func  getItemAtIndex(index:  Int)  ->  T?  {
        if  items.count  >  index  {
            return  items[index]
        }  else  {
            return  nil
        }
    }

}
//Type constraints can also be used with generic types. Once again, using a type constraint for a generic type is exactly the same as using one with a generic function. The following code shows how to use a type constraint to ensure that the generic type conforms to the comparable protocol:
struct MyStruct<T: Comparable>{}

//We can also define our generic types with multiple placeholder types, similar to how we use multiple placeholders in our generic methods. To use multiple placeholder types, we will separate them with commas. The following example shows how to define multiple placeholder types:
//
class MyClass<T,E>{
   }
//We then create an instance of the MyClass type that uses instances of the String and Integer types, like this:
var mc = MyClass<String, Int>()


var  list  =  List<String>()
list.add(item:  "Hello")
list.add(item:  "World")
print(list.getItemAtIndex(index:  1))

