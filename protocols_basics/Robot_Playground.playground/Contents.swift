import Cocoa

//for 2 dimensional movement
protocol  RobotMovement  {
    func  forward(speedPercent:  Double)
    func  reverse(speedPercent:  Double)
    func  left(speedPercent:  Double)
    func  right(speedPercent:  Double)
    func  stop()
}

//for 3 dimensional movement,inherit from 2d incase we want 2d or 3d acc to requirements
protocol  RobotMovementThreeDimensions:  RobotMovement  {
    func  up(speedPercent:  Double)
    func  down(speedPercent:  Double)
}

//basic sensor configuration for all sensors
protocol  Sensor  {
    var  sensorType:  String  {get}
    var  sensorName:  String  {get  set}
    
    init  (sensorName:  String)
    func  pollSensor()
}

//environment sensor with 2 additional methods
protocol  EnvironmentSensor:  Sensor  {
    func  currentTemperature()  ->  Double
    func  currentHumidity()  ->  Double
}
//range sensor
protocol  RangeSensor:  Sensor  {
    func  setRangeNotification(rangeCentimeter:  Double, rangeNotification:  ()  ->  Void)
    func  currentRange()  ->  Double
}
//display sensor
protocol  DisplaySensor:  Sensor  {
    func  displayMessage(message:  String)
}
//wireless sensor
protocol  WirelessSensor:  Sensor  {
    func  setMessageReceivedNotification(messageNotification: (String)  ->  Void)
    func  messageSend(message:  String)
}


//robot configuration

protocol  Robot  {
    var  name:  String  {get  set}
    var  robotMovement:  RobotMovement  {get  set}
    var  sensors:  [Sensor]  {get}
    
    init  (name:  String,  robotMovement:  RobotMovement)
    func  addSensor(sensor:  Sensor)
    func  pollSensors()
}

