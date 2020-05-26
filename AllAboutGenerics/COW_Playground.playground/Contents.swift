import Cocoa

fileprivate  class  BackendQueue<T>  {
    private  var  items  =  [T]()
    
    public  init()  {}
    private  init(_  items:  [T])  {
        self.items  =  items
    }

    
    public  func  addItem(item:  T)  {
        items.append(item)
    }
    
    public  func  getItem()  ->  T?  {
        if  items.count  >  0  {
            return  items.remove(at:  0)
        }  else  {
            return  nil
        }
    }
    public  func  count()  ->  Int  {
        return  items.count
    }
    
    public  func  copy()  ->  BackendQueue<T>  {
        return  BackendQueue<T>(items)
    }

}

struct  Queue  {
    private  var  internalQueue  =  BackendQueue<Int>()
    
    mutating  private  func  checkUniquelyReferencedInternalQueue()  {
        if  !isKnownUniquelyReferenced(&internalQueue)  {
            print("Making  a  copy  of  internalQueue")
            internalQueue  =  internalQueue.copy()
        }  else  {
            print("Not  making  a  copy  of  internalQueue")
        }
    }
    
    public  mutating  func  addItem(item:  Int)  {
        checkUniquelyReferencedInternalQueue()
        internalQueue.addItem(item:  item)
    }
    public  mutating  func  getItem()  ->  Int?  {
        checkUniquelyReferencedInternalQueue()
        return  internalQueue.getItem()
    }
    public  func  count()  ->  Int  {
        return  internalQueue.count()
    }
    mutating  public  func  uniquelyReferenced()  ->  Bool{
        return  isKnownUniquelyReferenced(&internalQueue)
    }
}

//Normally, when we pass an instance of a value type, such as a structure, we create a new copy of the instance. This means that if we had a large data structure that contained 50,000 elements, every time we passed that instance, we would have to copy all 50,000 elements. This could have a detrimental impact on the performance of our applications, especially if we passed that instance to numerous functions.
//To solve this issue, Apple has implemented the COW feature for all the data structures (array, dictionary, and set) within the Swift standard library. With COW, Swift does not make a second copy of the data structure until a change is made to that data structure. Therefore, if we pass an array of 50,000 elements to another part of our code, and that code does not actually make any changes to the array, we will avoid the runtime overhead of copying all the elements.

 var  queue3  =  Queue()
queue3.addItem(item:  1)

print(queue3.uniquelyReferenced())

var  queue4  =  queue3
print(queue3.uniquelyReferenced())
print(queue4.uniquelyReferenced())
queue3.addItem(item:  2)

print(queue3.uniquelyReferenced())
print(queue4.uniquelyReferenced())
