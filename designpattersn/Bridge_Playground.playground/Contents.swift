import Cocoa
//Structural design patterns
//Structural design patterns describe how types can be combined to form larger structures. These larger structures can generally be easier to work with, and hide a lot of the complexity of the individual types. Most patterns in the structural pattern category involve connections between objects.


//MARK:The bridge pattern
//The bridge pattern decouples the abstraction from the implementation so that they can both vary independently. The bridge pattern can also be thought of as a two-layer abstraction.

//MARK:Understanding the problem
//The bridge pattern is designed to solve a couple of problems, but the one we are going to focus on here tends to arise over time as new requirements come in with new features. At some point, as these new requirements and features come in, there will be a need to change how the features interact. Usually, without the bridge pattern, this will require us to refactor the code base.
//n object-oriented programming, this is known as an exploding class hierarchy, but it can also happen in protocol-oriented programming as well.


//MARK:Understanding the solution
//The bridge pattern solves this problem by taking the interacting features and separating the functionality that is specific to each feature from the functionality that is shared between them. A bridge type can then be created, which will encapsulate the shared functionality, bringing them together.
protocol  Message  {
    var  messageString:  String  {get  set}
    init(messageString:  String)
    func  prepareMessage()
}

protocol  Sender  {
    var  message:  Message?  {get  set}
    func  sendMessage()
    func  verifyMessage()
}


class  PlainTextMessage:  Message  {
    var  messageString:  String
    required  init(messageString:  String)  {
        self.messageString  =  messageString
    }
    func  prepareMessage()  {
        //Nothing  to  do
    }
}

class  DESEncryptedMessage:  Message  {
    var  messageString:  String
    required  init(messageString:  String)  {
        self.messageString  =  messageString
    }
    func  prepareMessage()  {
        //  Encrypt  message  here
        self.messageString  =  "DES:  "  +  self.messageString
    }
}


class  EmailSender:  Sender  {
    var  message:  Message?
    func  sendMessage()  {
        print("Sending  through  E-Mail:")
        print("\(message!.messageString)")
    }
    func  verifyMessage()  {
        
        
        print("Verifying  E-Mail  message")
    }
}

class  SMSSender:  Sender  {
    var  message:  Message?
    func  sendMessage()  {
        print("Sending  through  SMS:")
        print("  \(message!.messageString)")
    }
    func  verifyMessage()  {
        print("Verifying  SMS  message")
    }
}



var  myMessage  =  PlainTextMessage(messageString:  "Plain  Text  Message")
myMessage.prepareMessage()
var  sender  =  SMSSender()
sender.message  =  myMessage
sender.verifyMessage()
sender.sendMessage()

//The bridge pattern tells us that when we have two hierarchies that closely interact with each together, such as in this instance, we should put this interaction logic into a bridge type that will encapsulate the logic in one spot. This way, when we receive new requirements or enhancements, the change can be made in one spot, thereby limiting the refactoring that is required. We could make a bridge type for our message and sender hierarchies
struct  MessagingBridge  {
    static  func  sendMessage(message:  Message,  sender:  Sender)    {
        var  sender  =  sender
        message.prepareMessage()
        sender.message  =  message
        sender.verifyMessage()
        sender.sendMessage()
    }
}


