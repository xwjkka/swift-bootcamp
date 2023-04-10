//
//  File.swift
//  
//
//  Created by Jeanna Krysten on 3/16/23.
//

import Foundation

enum profession {
    case Developer
    case QA
    case ProjectManager
    case Analyst
    case Designer
}

enum level {
    case junior
    case middle
    case senior
}

struct candidate {
    var name: String
    var profession: profession
    var level: level
    var sex: String
    var dateOfBirth: String
    var contacts: [String]
    var readiness: Bool
    var education: [educationalInstitution]
    var experience: [placeOfWork]
    var description: String
}

struct educationalInstitution {
    var type: String
    var years: String
    var description: String
}

struct placeOfWork {
    var period: String
    var name: String
    // контакты если есть
    var description: String
}

enum FileError: Error {
    case NotFound
}

@main
public struct analysis {
    
    public static func writeToFile(text: String, file: String) throws {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
//            do {
//                try text.write(to: fileURL, atomically: false, encoding: .utf8)
//            }
//            catch {
//                print("Wrong file")
//            }
            guard try text.write(to: fileURL, atomically: false, encoding: .utf8) != nil else {
                throw FileError.NotFound
            }
        }
    }
    
    static func makeResume(candidate: candidate) -> String {
        var text = "# Candidate info\n\(candidate.name)\n\(candidate.profession)\n\(candidate.sex)\n\(candidate.dateOfBirth)\n\(candidate.contacts[0]), \(candidate.contacts[1])\n\(candidate.readiness)\n\n# Education\n"
        
        for i in 0..<candidate.education.count {
            if candidate.education.count > 1 {
                text.append("##\n")
            }
            text.append("\(candidate.education[i].type)\n\(candidate.education[i].years)\n\(candidate.education[i].description)\n")
        }
        text.append("\n# Job experience\n")
        for i in 0..<candidate.experience.count {
            if candidate.experience.count > 1 {
                text.append("##\n")
            }
            text.append("\(candidate.experience[i].period)\n\(candidate.experience[i].name)\n\(candidate.experience[i].description)\n")
        }
        text.append("\n# Free block\n\(candidate.description)")
        
        return text
    }
    
    static func readTags() -> [String:Int] {
        var countTags = [String:Int]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("tags.txt")
            do {
                let tagText = try String(contentsOf: fileURL, encoding: .utf8)
                let lines = tagText.components(separatedBy: [" ", ",", "\n"])
                for i in lines {
                    countTags[i] = 0;
                }
            } catch {
                print("Wrong file")
            }
        }
        return countTags
    }
    
    static func makeAnalys() {
        
    }

    public static func main() {
        let xwjkka = candidate(name: "Khurmuzakii Olesya Arkadievna", profession: profession.Developer, level: level.junior, sex: "Female", dateOfBirth: "12.05.2004", contacts: ["hurmuzz@yandex.ru", "89775176539"], readiness: false, education: [educationalInstitution(type: "higher", years: "2020-2024", description: "Polytech")], experience: [placeOfWork(period: "1995-2345", name: "m&m's", description: "best company ever"), placeOfWork(period: "1995-2345", name: "not m&m's", description: "not best company ever")], description: "hi")
        
        let text = makeResume(candidate: xwjkka)

        var file = "export.txt"
        do {
            try writeToFile(text: text, file: file)
        } catch {
            print("Not found")
        }

        var countTags = readTags()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                var countWords = [String:Int]()
                
                let lines = text2.components(separatedBy: [" ", ",", "\n"])
                for i in lines {
                    if countWords[i] == nil {
                        countWords[i] = 1;
                    } else {
                        countWords[i]! += 1;
                    }
                    
                    if countTags[i] != nil {
                        countTags[i]! += 1
                    }
                }
                
                let array = countWords.sorted{$0.value > $1.value}
                let keys = array.map {return $0.0 }
                let values = array.map {return $0.1 }
                var analysText:String = "# Words\n"
                for i in 0..<keys.count {
                    analysText.append("\(keys[i]) \(values[i])\n")
                }
                analysText.append("\n# Matched tags\n")
                for i in countTags {
                    if i.value != 0 {
                        analysText.append("\(i.key)\n")
                    }
                }
                file = "analysis.txt"
                do {
                    try writeToFile(text: analysText, file: file)
                } catch {
                    print("Not found")
                }
                
                
            } catch {
                print("Wrong file")
            }
        }
    }
}

