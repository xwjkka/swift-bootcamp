//
//  main.swift
//  05_circles
//
//  Created by Jeanna Krysten on 3/13/23.
//

import Foundation
@main
public struct circles {
    
    public static func main() {
        if let str_x1 = readLine(), let str_y1 = readLine(), let str_r1 = readLine(), let str_x2 = readLine(), let str_y2 = readLine(), let str_r2 = readLine()
        {
            if let x1 = Double(str_x1), let y1 = Double(str_y1), let r1 = Double(str_r1), let x2 = Double(str_x2), let y2 = Double(str_y2), let r2 = Double(str_r2)
            {
                if (r1 < 0) || (r2 < 0) {
                    //            throw Exception("wrong radius")
                    print("Math Error")
                } else {
                    let dist : Double = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
                    if (x1 == x2) && (y1 == y2) {
                        print("One circle is inside another")
                    } else if r1 + r2 >= dist {
                        print("The circles intersect")
                        let b : Double = (pow(r2, 2) - pow(r1, 2) + pow(dist, 2)) / (2 * dist)
                        let a : Double = dist - b
                        let h : Double = sqrt(pow(r1, 2) - pow(a, 2))
                        let p0x : Double = x1 + (a/dist) * (x2 - x1) ; let p0y : Double = y1 + (a/dist) * (y2 - y1)
                        let p3x : Double = p0x + (y2 - y1)/dist * h ; let p3y : Double = p0y - (x2 - x1)/dist * h
                        let p4x : Double = p0x - (y2 - y1)/dist * h ; let p4y : Double = p0y + (x2 - x1)/dist * h
                        
                        print("Первая точка: P3(\(p3x); \(p3y)).")
                        if r1 + r2 > dist {
                            print("Вторая точка: P4(\(p4x); \(p4y)).")
                        }
                    } else {
                        print("no")
                    }
                }
                
            }
            else{
                print("Couldn't parse a number. Please, try again")  // нужно чтобы ввод продолжился
            }
        }
    }
}
