//
//  prime_numbers.swift
//  
//
//  Created by Jeanna Krysten on 3/13/23.
//

import Foundation

@main
public struct prime_numbers {


    enum InputError: Error {
        case invalidNumber
    }
    
    public static func main() {
        var order : Bool = false
        for argument in CommandLine.arguments
        {
            switch argument {
            case "higher":
                order = true
                
            default:
                order = false
            }
        }
        let number = readLine()
        var str = String()
        if let _ = Int(number!) {
            if order {
                for i in 0..<number!.count {
                    let char = number![number!.index(number!.startIndex, offsetBy: number!.count - 1 - i)]
                    str += String(char)
                    print(str)
                }
            } else {
                for character in number! {
                    str += String(character)
                    print(str)
                }
            }
        } else {
//            throw InputError.invalidNumber
            print("Invalid Input")
        }
    }
}
