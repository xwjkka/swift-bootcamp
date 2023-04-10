//
//  File.swift
//  
//
//  Created by Olesya Khurmuzakiy on 16.03.2023.
//
import Foundation

func readFromFile(file: String) -> String?{
    var text2:String? = nil
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(file)
        do {
            text2 = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            print("Wrong file")
        }
    }
    return text2
}

@main
public struct compare {
    
    public static func compareFiles(first: String, second: String) -> Bool{
        return first == second
    }
    
    public static func main() {
        let fileFirst:String? = readFromFile(file: "1.txt")
        let fileSecond:String? = readFromFile(file: "2.txt")
        if (fileFirst != nil && fileSecond != nil) {
            let fileOne = fileFirst! ; let fileTwo = fileSecond!
            if compareFiles(first: fileOne, second: fileTwo) {
                print("Text comparator: resumes are identical")
            } else {
                print("Text comparator: resumes are NOT identical")
            }
        }
    }
}
