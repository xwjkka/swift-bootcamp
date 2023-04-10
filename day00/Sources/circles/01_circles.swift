//
//  main.swift
//  01_circles
//
//  Created by Jeanna Krysten on 3/13/23.
//

import Foundation
@main
public struct circles {
    
    public static func main() {
        if let str_x1 = readLine(), let str_y1 = readLine(), let str_r1 = readLine(), let str_x2 = readLine(), let str_y2 = readLine(), let str_r2 = readLine()
        {
            if let x1 = Float(str_x1), let y1 = Float(str_y1), let r1 = Float(str_r1), let x2 = Float(str_x2), let y2 = Float(str_y2), let r2 = Float(str_r2)
            {
                if (r1 < 0) || (r2 < 0) {
                    //            throw Exception("wrong radius")
                    print("Math Error")
                } else {
                    let dist : Float = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
                    if (x1 == x2) && (y1 == y2) {
                        print("One circle is inside another")
                    } else if r1 + r2 >= dist {
                        print("The circles intersect")
                    } else {
                        print("no")
                    }
                }
            }
            else{
                print("Couldn't parse a number. Please, try again")
            }
        }
    }
}
