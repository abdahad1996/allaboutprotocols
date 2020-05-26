import Cocoa

struct  List<T>  {
    private  var  items  =  [T]()
    public  mutating  func  add(item:  T)  {
        items.append(item)
    }
    public  func  getItemAtIndex(index:  Int)  ->  T?  {
        if  items.count  >  index  {
            return  items[index]
        }  else  {
            return  nil
        }
    }
    //let's say that we have a requirement to retrieve a range of elements from the list using a subscript.
    public  subscript(index:  Int)  ->  T?  {
            print("subscript ",index)
        return  getItemAtIndex(index:  index)
    }
    //This subscript will take a sequence of indices and will return an array containing the values at each index. We define a generic type (E) that must conform to the Sequence protocol and then use that type as the parameter for the subscript. With the where clause, we are requiring the elements in the iterator, within the E type, to be of the Integer type.
    public  subscript<E:  Sequence>(indices:  E)  ->  [T]  where  E.Iterator.Element ==  Int  {
            var  result  =  [T]()
            for  index  in  indices  {
                result.append(items[index])
            }
            return  result
    }

}

var  myList  =  List<Int>()
myList.add(item:  1)
myList.add(item:  2)
myList.add(item:  3)
myList.add(item:  4)
myList.add(item:  5)

print("value",myList[2])
//var  values  =  myList[2...4]
