import Cocoa
//MARK:The facade pattern
//The facade pattern provides a simplified interface for a larger and more complex body of code. This allows us to make libraries easier to use and understand by hiding some of the complexities. It also allows us to combine multiple APIs into a single, easier-to-use API, which is what we will see in our example.

//MARK:Understanding the problem
// facade pattern is often used when there is a complex system that has a large number of independent APIs that are designed to work together. Sometimes, it is hard to tell where the facade pattern should be used during the initial application design. The reason for this is that we normally try to simplify the initial API design. However, over time, and as requirements change and new features are added, the APIs become more and more complex. At this point, it becomes pretty evident where the facade pattern should have been used. A good rule to use is this: if you have several APIs that are working closely together to perform a task, you should consider using the facade pattern

//MARK:Understanding the solution
//The main idea of the facade pattern is to hide the complexity of the APIs behind a simple interface. This offers several advantages, the most obvious being that it simplifies how external code interacts with the APIs. It also promotes loose coupling, which allows the APIs to change without the need to refactor all the code that uses them.
struct  Hotel  {
    //Information  about  hotel  room
}

struct  HotelBooking  {
    static  func  getHotelNameForDates(to:  NSDate,  from:  NSDate)  -> [Hotel]?  {
        let  hotels  =  [Hotel]()
        return hotels
        //logic  to  get  hotels return  hotels
    }
    
    static  func  bookHotel(hotel:  Hotel)  {
        //  logic  to  reserve  hotel  room
    }
}

struct  Flight  {
    //Information  about  flights
}

struct  FlightBooking  {
    static  func  getFlightNameForDates(to:  NSDate,  from:  NSDate)  -> [Flight]?  {
        let  flights  =  [Flight]()
        //logic  to  get  flights
        return  flights
    }
    
    static  func  bookFlight(flight:  Flight)  {
        //  logic  to  reserve  flight
    }
}
    
    struct  RentalCar  {
        //Information  about  rental  cars
    }
    
    struct  RentalCarBooking  {
        static  func  getRentalCarNameForDates(to:  NSDate,  from:  NSDate) ->  [RentalCar]?  {
            let  cars  =  [RentalCar]()
                //logic  to  get  cars
            return  cars
        }
        
        static  func  bookRentalCar(rentalCar:  RentalCar)  {
            //  logic  to  reserve  rental  car
        }
}

//, we will create three APIs: HotelBooking, FlightBooking, and RentalCarBooking. These APIs will be used to search for and book hotels, flights, and rental cars for trips. While it would be very easy to call each of the APIs individually, we are going to create a TravelFacade structure that will consolidate the functionality of all three APIs into a single call.

//A good rule to follow is this: if we have several APIs that are working together to perform a task, the facade pattern should be considered.
struct  TravelFacade  {
    
    var  hotels:  [Hotel]?
    var  flights:  [Flight]?
    var  cars:  [RentalCar]?
    
    init(to:  NSDate,  from:  NSDate)  {
        hotels  =  HotelBooking.getHotelNameForDates(to:  to,  from:  from)
        flights  =  FlightBooking.getFlightNameForDates(to:  to,  from:  from)
        cars  =  RentalCarBooking.getRentalCarNameForDates(to:  to,from:  from)
    }
    
    func  bookTrip(hotel:  Hotel,  flight:  Flight,  rentalCar:  RentalCar)  {
        HotelBooking.bookHotel(hotel:  hotel)
        FlightBooking.bookFlight(flight:  flight)
        RentalCarBooking.bookRentalCar(rentalCar:  rentalCar)
    }
}
