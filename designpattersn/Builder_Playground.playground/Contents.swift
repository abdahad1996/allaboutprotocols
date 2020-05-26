import Cocoa
//The builder design pattern
//MARK: INTRO
//The builder pattern helps with the creation of complex objects and enforces the process of how these objects are created. This pattern is generally used to separate the creation logic from the complex type and put it in another type. This will be the same construction process used to create different representations of the type.
//MARK: Understanding the problem
//The problem that the builder pattern is designed to address is when an instance of a type requires numerous configurable values. The configuration options could be set when an instance of the type is created, but that can cause issues if the options are not set correctly or the proper values for all the options are unknown. Another issue is the amount of code that may be needed to set all the configurable options each time an instance is created.

//Creating instances of the BurgerOld type in this manner requires a lot of code.
//f there was more than one standard burger type (bacon cheeseburger, cheeseburger, hamburger, and so on), then we would need to make sure that each is defined correctly
struct  BurgerOld  {
    var  name:  String
    var  patties:  Int
    var  bacon:  Bool
    var  cheese:  Bool
    var  pickles:  Bool
    var  ketchup:  Bool
    var  mustard:  Bool
    var  lettuce:  Bool
    var  tomato:  Bool
    init(name:  String,  patties:  Int,  bacon:  Bool,  cheese:  Bool, pickles:  Bool,  ketchup:  Bool,  mustard:  Bool, lettuce:  Bool,  tomato:  Bool)  {
        self.name  =  name
        self.patties  =  patties
        self.bacon  =  bacon
        self.cheese  =  cheese
        self.pickles  =  pickles
        self.ketchup  =  ketchup
        self.mustard  =  mustard
        self.lettuce  =  lettuce
        self.tomato  =  tomato
    }
}

//  Create  Hamburger
var  burgerOld  =  BurgerOld(name:  "Hamburger",  patties:  1,  bacon:  false, cheese:  false,  pickles:  false,  ketchup:  false, mustard:  false,  lettuce:  false,  tomato:  false)

//  Create  Cheeseburger
var  cheeseburgerOld  =  BurgerOld(name:  "Cheeseburger",  patties:  1, bacon:  false,  cheese:  false, pickles:  false,  ketchup:  false, mustard:  false,  lettuce:  false, tomato:  false)

//MARK: Implementing the builder pattern
//This protocol simply defines the nine properties that will be required for any type that implements this protocol
protocol  BurgerBuilder  {
    var  name:  String  {get}
    var  patties:  Int  {get}
    var  bacon:  Bool  {get}
    var  cheese:  Bool  {get}
    var  pickles:  Bool  {get}
    var  ketchup:  Bool  {get}
    var  mustard:  Bool  {get}
    var  lettuce:  Bool  {get}
    var  tomato:  Bool  {get}
}

//The HamburgerBuilder and CheeseBurgerBuilder structures simply define the values for each of the required properties. In more complex types, we might need to initialize additional resources.
struct  HamburgerBuilder:  BurgerBuilder  {
    let  name  =  "Burger"
    let  patties  =  1
    let  bacon  =  false
    let  cheese  =  false
    let  pickles  =  true
    let  ketchup  =  true
    let  mustard  =  true
    let  lettuce  =  false
    let  tomato  =  false
}

struct  CheeseBurgerBuilder:  BurgerBuilder  {
    let  name  =  "CheeseBurger"
    let  patties  =  1
    let  bacon  =  false
    let  cheese  =  true
    let  pickles  =  true
    let  ketchup  =  true
    let  mustard  =  true
    let  lettuce  =  false
    let  tomato  =  false
}

//the Burger structure, which will use instances of the BurgerBuilder protocol to create instances of itself

struct  Burger  {
    var  name:  String
    var  patties:  Int
    var  bacon:  Bool
    var  cheese:  Bool
    var  pickles:  Bool
    var  ketchup:  Bool
    var  mustard:  Bool
    var  lettuce:  Bool
    var  tomato:  Bool
    
    init(builder:  BurgerBuilder)  {
        self.name  =  builder.name
        self.patties  =  builder.patties
        self.bacon  =  builder.bacon
        self.cheese  =  builder.cheese
        self.pickles  =  builder.pickles
        self.ketchup  =  builder.ketchup
        self.mustard  =  builder.mustard
        self.lettuce  =  builder.lettuce
        self.tomato  =  builder.tomato
    }
    
    func  showBurger()  { print("Name:\(name)")
        print("Patties:  \(patties)")
        print("Bacon:\(bacon)")
        print("Cheese:\(cheese)")
        print("Pickles:  \(pickles)")
        print("Ketchup:  \(ketchup)")
        print("Mustard:  \(mustard)")
        print("Lettuce:  \(lettuce)")
        print("Tomato:\(tomato)")
    }
}

//If we compare how instances of the new Burger structure are created to the earlier BurgerOld structure, it is pretty clear that it is easier to create instances of this new Burger structure. We also know that we are correctly setting the property values for each type of burger because the values are set directly in the builder classes.

//  Create  Hamburger
var  myBurger  =  Burger(builder:  HamburgerBuilder())
myBurger.showBurger()

//  Create  Cheeseburger  with  tomatos
var  myCheeseBurgerBuilder  =  CheeseBurgerBuilder()
var  myCheeseBurger  =  Burger(builder:  myCheeseBurgerBuilder)

//  Let's  hold  the  tomatos
myCheeseBurger.tomato  =  true
myCheeseBurger.showBurger()

//There is a second method that can be used to implement the builder pattern. Rather than having multiple builder types, there can be a single builder type that sets all the configurable options to default values. The values can then be changed as needed. I use this implementation method a lot when I am updating older code because it is easy to integrate it with pre-existing code.
struct  BurgerBuilder1  {
    var  name  =  "Burger"
    var  patties  =  1
    var  bacon  =  false
    var  cheese  =  false
    var  pickles  =  true
    var  ketchup  =  true
    var  mustard  =  true
    var  lettuce  =  false
    var  tomato  =  false
    
    mutating  func  setPatties(choice:  Int)  {self.patties  =  choice}
    mutating  func  setBacon(choice:  Bool)  {self.bacon  =  choice}
    mutating  func  setCheese(choice:  Bool)  {self.cheese  =  choice}
    mutating  func  setPickles(choice:  Bool)  {self.pickles  =  choice}
    mutating  func  setKetchup(choice:  Bool)  {self.ketchup  =  choice}
    mutating  func  setMustard(choice:  Bool)  {self.mustard  =  choice}
    mutating  func  setLettuce(choice:  Bool)  {self.lettuce  =  choice}
    mutating  func  setTomato(choice:  Bool)  {self.tomato  =  choice}
    
    func  buildBurgerOld(name:  String)  ->  BurgerOld  {
        return  BurgerOld(name:  name,  patties:  self.patties, bacon:  self.bacon,  cheese:  self.cheese, pickles:  self.pickles,  ketchup:  self.ketchup, mustard:  self.mustard,  lettuce:  self.lettuce, tomato:  self.tomato)
    }
}
//Both of these methods that are used to implement the builder pattern greatly simplify the creation of the complex type. Both methods also ensure that the instances are properly configured with default values. If you find yourself creating instances of types with very long and complex initialization commands, I would recommend that you look at the builder pattern to see whether you can use it to simplify the initialization.

var  burgerBuilder  =  BurgerBuilder1()
burgerBuilder.setCheese(choice:  true)
burgerBuilder.setBacon(choice:  true)
var  jonBurger  =  burgerBuilder.buildBurgerOld(name:  "Jon's  Burger")
