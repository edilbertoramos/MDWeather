# MDWeather
Display weather details

## Interface
- Swift UI

## Native frameworks and classes
- CoreLocation
- FileManager
- URLSession
- Codable
- Concurrency

## File resources
- .xcconfig
- .xcassets

## Porject archtecture
- MVVM

## Design patterns 
- Singleton
- Factory

## Other designs 
- POP - _Protocol Oriented Programming_
- SOLID


## External libreries
_Empty_

# Observatios
- The URL to get icons (http://...) forces the application to set the **Allow Arbitrary Loads** key to **true**, which is not recommended.
- As the app uses the user's location to get the weather of the user's region, it may be need to enable the location feature in iOS Simulator.
