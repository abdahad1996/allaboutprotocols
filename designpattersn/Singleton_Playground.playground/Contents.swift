import Cocoa
//creational design pattern
//Creational patterns are design patterns that deal with how an object is created. There are two basic ideas behind creational patterns. The first is the encapsulation of the knowledge of which concrete types should be created, and the second involves hiding how instances of these types are created.

//MARK: INTRO
//The singleton pattern restricts the instantiation of a class to a single instance for the lifetime of an application. This pattern is very effective when we need exactly one instance to coordinate actions within our application. An example of a good use of a singleton is if our application communicates with a remote device over Bluetooth and we also want to maintain that connection throughout our application. Some would say that we could pass the instance of the connection class from one page to the next, which is essentially what a singleton is. In my opinion, the singleton pattern, in this instance, is a much cleaner solution, because with the singleton pattern, any page that needs the connection can get it without forcing every page to maintain the instance. This also allows us to maintain the connection without having to reconnect each time we go to another page.

//MARK: UNDERSTANDING THE PROBLEM
//The problem the singleton pattern is designed to address is when we need one, and only one, instance of a type for the lifetime of our application. The singleton pattern is usually used when we need centralized management of an internal or external resource and a single global point of access. Another popular use of the singleton pattern is when we want to consolidate a set of related activities, needed throughout our application, that does not maintain a state.
//MARK:SOLUTIION
//Understanding the solution
//There are several ways to implement the singleton pattern in Swift. The way that is presented here uses class constants that were first introduced in version 1.2 of Swift. With this method, a single instance of the class is created the first time we access the class constant. We will then use the class constant to gain access to this instance throughout the lifetime of our application. We will also create a private initializer that will prevent external code from creating additional instances of the class.
//Note that we use the word "class" in this description and not "type". The reason for this is that the singleton pattern can only be implemented with reference types.
class  MySingleton  {
    static  let  sharedInstance  =  MySingleton()
    var  number  =  0
    private  init()  {}
}

var singleA = MySingleton.sharedInstance
var singleB = MySingleton.sharedInstance
var singleC = MySingleton.sharedInstance
singleB.number  =  2
print(singleA.number)
print(singleB.number)
print(singleC.number)
singleC.number  =  3
print(singleA.number)
print(singleB.number)
print(singleC.number)

