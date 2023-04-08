//
//  File.swift
//
//
//  Created by Jeanna Krysten on 3/13/23.
//

import Foundation

@main
public struct thermometer {
    enum IntputError: Error {
        case invalidScale
        case invalidSeason
        case invalidTemperature
    }
    
    public static func check_temperature(temp: Double, low: Double, hight: Double, scale: Character) {
        print("The comfortable temperature is from \(low) to \(hight) ˚\(scale)")
        if temp > hight {
            print("Please, make it colder by \(temp - hight) degrees.")
        } else if temp < low {
            print("Please, make it warmer by \(low - temp) degrees.")
        } else {
            print("Alright")
        }
        
    }
    
    public static func to_kelvin(temp: Double) -> Double {
        return temp + 273.15
    }
    
    public static func to_fahrenheit(temp: Double) -> Double {
        return temp * 9/5 + 32
    }
    
    public static func check_humidity(hum: Int, low: Int, high: Int) {
        print("The comfortable humidity is from \(low)% to \(high)%")
        if hum > high {
            print("Please, reduce humidity by \(hum - high)%")
        } else if hum < low {
            print("Please, increase humidity by \(low - hum)%")
        } else {
            print("The humidity is comfortable")
        }
    }
    
    public static func main() {
        let str_scale = readLine() ; let season = readLine() ; let degree = readLine() ; let humidity = readLine()
        
        
        
        switch str_scale {
        case "Celsis":
            print("The temperature is \(degree!)˚C")
            switch season {
            case "W":
                check_temperature(temp: Double(degree!)!, low: 20, hight: 22, scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 45)
            case "S":
                check_temperature(temp: Double(degree!)!, low: 22, hight: 25, scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 60)
            default:
                print("Error")
                //                throw IntputError.invalidSeason
            }
        case "Kelvin":
            switch season {
            case "W":
                check_temperature(temp: to_kelvin(temp: Double(degree!)!), low: to_kelvin(temp: 20), hight: to_kelvin(temp: 22), scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 45)
            case "S":
                check_temperature(temp: to_kelvin(temp: Double(degree!)!), low: to_kelvin(temp: 22), hight: to_kelvin(temp: 25), scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 60)
            default:
                print("Error")
            }
        case "Fahrenheit":
            switch season {
            case "W":
                check_temperature(temp: to_fahrenheit(temp: Double(degree!)!), low: to_fahrenheit(temp: 20), hight: to_fahrenheit(temp: 22), scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 45)
            case "S":
                check_temperature(temp: to_fahrenheit(temp: Double(degree!)!), low: to_fahrenheit(temp: 22), hight: to_fahrenheit(temp: 25), scale: str_scale![str_scale!.startIndex])
                check_humidity(hum: Int(humidity!)!, low: 30, high: 60)
            default:
                print("Error")
            }
        default:
            print("Error")
        }
        
    }
}
