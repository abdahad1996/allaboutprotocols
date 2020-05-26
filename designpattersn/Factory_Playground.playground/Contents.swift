import Cocoa
//MARK:The factory method pattern
//The factory method pattern uses methods to create instances of objects without specifying the exact type that will be created. This allows the code to pick the appropriate type to create at runtime.
//I find that the factory pattern is one of the patterns that I use a lot. It is also one of the patterns that developers tend to recognize when they first start reading about design patterns because they have used it in previous projects.


//MARK:Understanding the problem
//The problem that the factory pattern is designed to solve is when there are multiple types that conform to a single protocol and the appropriate type to instantiate needs to be chosen at runtime.

//MARK:Understanding the solution
//The factory method pattern encapsulates the logic that is used to select the type to instantiate within a single method. This method exposes only the protocol (or base class) to the code that calls it and does not reveal the details of how a particular type was selected.
protocol  TextValidation  {
    var  regExFindMatchString:  String  {get}
    var  validationMessage:  String  {get}
}

extension  TextValidation  {
    var  regExMatchingString:  String  {
        get  {
            return  regExFindMatchString  +  "$"
        }
    }
    
    func  validateString(str:  String)  ->  Bool  {
        if  let  _  =  str.range(of:  regExMatchingString, options:  .regularExpression)  {
            return  true
        }  else  {
            return  false
        }
    }
    
    func  getMatchingString(str:  String)  ->  String?  {
        if  let  newMatch  =  str.range(of:  regExFindMatchString, options:  .regularExpression)  {
            return  String(str[newMatch])
        }  else  {
            return  nil
        }
    }
}


class  AlphaValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphaValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z]{0,10}"
    let  validationMessage  =  "Can  only  contain  Alpha  characters"
}

class  AlphaNumericValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphaNumericValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z0-9]{0,10}"
    let  validationMessage  =  "Can  only  contain  Alpha  Numeric  characters"
}

class  NumericValidation:  TextValidation  {
    static  let  sharedInstance  =  NumericValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[0-9]{0,10}"
    let  validationMessage  =  "Display  Name  can  contain  a  maximum  of 15  Alphanumeric Characters"
}

//factory method
//One of the biggest advantages of using this pattern is that all the logic regarding how the text validation types are selected is encapsulated in this one function. This means that if the logic used to select the text validation type changes, the only code that needs to change is the code in that function, and we will not need to refactor the entire code base. As an example, if we wish to replace the AlphaValidation class with a new AlphaSpacesValidation class, the only code that needs to change is within this function.
func  getValidator(alphaCharacters:  Bool,  numericCharacters:  Bool)  -> TextValidation?  {
    if  alphaCharacters  &&  numericCharacters  {
        return  AlphaNumericValidation.sharedInstance
    }  else  if  alphaCharacters  &&  !numericCharacters  {
        return  AlphaValidation.sharedInstance
    }  else  if  !alphaCharacters  &&  numericCharacters  {
        return  NumericValidation.sharedInstance
    }  else  {
        return  nil
    }
}

var  str  =  "abc123"
var  validator1  =  getValidator(alphaCharacters:  true, numericCharacters:  false)
print("String  validated:  \(validator1?.validateString(str:  str))")

var  validator2  =  getValidator(alphaCharacters:  true, numericCharacters:  true)
print("String  validated:  \(validator2?.validateString(str:  str))")
