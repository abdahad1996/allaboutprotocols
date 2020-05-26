import Cocoa
//Behavioral design patterns
//Behavioral design patterns explain how types interact with each other. These patterns describe how different instances of types send messages to each other to make something happen.

//The command design pattern
//The command design pattern lets us define actions that can be executed later. This pattern generally encapsulates all the information needed to call or trigger the actions later.

//Understanding the problem
//There are times when we need to separate the execution of a command from its invoker. Typically, this is when there is a type that needs to perform one of several actions; however, the choice of which action to use needs to be made at runtime

//Understanding the solution
//The command pattern tells us that we should encapsulate the logic for the various actions into a separate type that conforms to a command protocol. We can then provide instances of the command types for use by the invoker. The invoker will use the interface provided by the protocol to invoke the actions required.
protocol  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double
}


struct  AdditionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  +  num2
    }
}

struct  SubtractionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  -  num2
    }
}

struct  MultiplicationCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  *  num2
    }
}


struct  DivisionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  /  num2
    }
}

struct  Calculator  {
    func  performCalculation(num1:  Double,  num2:  Double, command:  MathCommand)  ->  Double{
        return  command.execute(num1:  num1,  num2:  num2)
    }
}


var  calc  =  Calculator()
var  startValue  =  calc.performCalculation(num1:  25,  num2:  10,  command: SubtractionCommand())
var  answer  =  calc.performCalculation(num1:  startValue,  num2:  5,  command: MultiplicationCommand())



//STRATEGY PATTERN
//The strategy pattern is good for setting the algorithms to use at runtime, which also lets us swap the algorithms out with different implementations as needed by the application. This pattern also allows us to encapsulate the details of the algorithm within the strategy types themselves, and not in the main implementation type.

//Understanding the problem
//There are times in our applications when we need to change the backend algorithm that is used to perform an operation. Typically, this is when we have a type that has several different algorithms that can be used to perform the same task. However, the choice of which algorithm to use needs to be made at runtime.

//Understanding the solution
// strategy pattern tells us that we should encapsulate the algorithm in a type that conforms to a strategy protocol. We can then provide instances of the strategy types for use by the invoker. The invoker will use the interface provided by the protocol to invoke the algorithm.
protocol CompressionStrategy {
       func compressFiles(filePaths: [String])
}

struct ZipCompressionStrategy: CompressionStrategy {
       func  compressFiles(filePaths: [String]) {
print("Using Zip Compression") }
}
   struct RarCompressionStrategy: CompressionStrategy {
       func compressFiles(filePaths: [String]) {
print("Using RAR Compression") }
}

struct CompressContent {
   var strategy: CompressionStrategy
func compressFiles(filePaths: [String]) {
    self.strategy.compressFiles(filePaths: filePaths)
    }
}

var filePaths = ["file1.txt", "file2.txt"]
var zip = ZipCompressionStrategy()
var rar = RarCompressionStrategy()
var compress = CompressContent(strategy: zip)
compress.compressFiles(filePaths: filePaths)
compress.strategy = rar
compress.compressFiles(filePaths: filePaths)
