//
//  File.swift
//  
//
//  Created by Jeanna Krysten on 3/13/23.
//

import Foundation

@main
public struct thermometer {
    public static func check_temperature(temp: Double, low: Double, hight: Double, scale: Character) {
        print("The comfortable temperature is from \(low) to \(hight) ˚\(scale)")
        if temp > hight {
            print("Please, make it colder by \(hight - temp) degrees.")
        } else if temp < low {
            print("Please, make it warmer by \(temp - low) degrees.")
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

    public static func main() {
        let str_scale = readLine() ; let season = readLine() ; let degree = readLine()
        switch str_scale {
        case "Celsis":
            print("The temperature is \(degree!)˚C")
            switch season {
            case "W":
                check_temperature(temp: Double(degree!)!, low: 20, hight: 22, scale: str_scale![str_scale!.startIndex])
            case "S":
                check_temperature(temp: Double(degree!)!, low: 22, hight: 25, scale: str_scale![str_scale!.startIndex])
            default:
                print("Error")
            }
        case "Kelvin":
            switch season {
                case "W":
                    check_temperature(temp: to_kelvin(temp: Double(degree!)!), low: to_kelvin(temp: 20), hight: to_kelvin(temp: 22), scale: str_scale![str_scale!.startIndex])
                case "S":
                    check_temperature(temp: to_kelvin(temp: Double(degree!)!), low: to_kelvin(temp: 22), hight: to_kelvin(temp: 25), scale: str_scale![str_scale!.startIndex])
                default:
                    print("Error")
            }
        case "Fahrenheit":
            switch season {
                case "W":
                    check_temperature(temp: to_fahrenheit(temp: Double(degree!)!), low: to_fahrenheit(temp: 20), hight: to_fahrenheit(temp: 22), scale: str_scale![str_scale!.startIndex])
                case "S":
                    check_temperature(temp: to_fahrenheit(temp: Double(degree!)!), low: to_fahrenheit(temp: 22), hight: to_fahrenheit(temp: 25), scale: str_scale![str_scale!.startIndex])
                default:
                    print("Error")
            }
        default:
            print("Error")
        }
        
    }
}
