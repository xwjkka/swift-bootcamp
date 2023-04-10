//
//  File.swift
//  
//
//  Created by Jeanna Krysten on 3/16/23.
//

import Foundation

enum companyActivity {
    case IT
    case Banking
    case PublicServices
}

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

struct company {
    var name: String
    var activity: companyActivity
    var description: String
    var vacanciesList: [vacancy]
    var contacts: String
    
    func interview(k: Int, candidate: candidate) -> Bool {
        var res: Bool = false
        for vacancy in self.vacanciesList {
            if (vacancy.profession == candidate.profession) && (vacancy.level == candidate.level) && (abs(vacancy.salary - candidate.salary) <= 10000) {
                suitableVacancy(k: k, vacancy: vacancy, company: self)
                res = true
            }
        }
        return res
    }
}

func suitableVacancy(k: Int, vacancy: vacancy, company: company) {
    print("\(k).")
    print("\(vacancy.level) \(vacancy.profession)     ---      from \(vacancy.salary)")
    print("\t\(company.name)")
    print("\t\(company.activity)")
}

struct vacancy {
    var profession: profession
    var level: level
    var salary: Int
}

struct candidate {
    var name: String
    var activity: companyActivity
    var profession: profession
    var level: level
    var salary: Int
    var skills: [String]
}

@main
public struct interview {
    static func printVac(comps: [company], candidate: candidate) {
        print("\(candidate.activity). \(candidate.profession). \(candidate.level). > \(candidate.salary)")
        print("The list of suitable vacancies:\n")
        var k: Int = 0
        for i in comps {
            if i.interview(k: k + 1, candidate: candidate) {
                k += 1
                print("---------------------------------------\n")
            }
        }
        if k > 0 {
            print("\(k)\n")
            print("Proccessing Interview...")
            print("Success, candidate was applied.")
        } else {
            print("lame")
        }
    }
    
    public static func main() {
        let qa = vacancy(profession: profession.QA, level: level.junior, salary: 110000)
        let dis = vacancy(profession: profession.Designer, level: level.middle, salary: 5)
    
        let sber = company(name: "Sberbank", activity: companyActivity.Banking, description: "banking", vacanciesList: [qa, dis], contacts: "8800898989")
        let gg = company(name: "gg", activity: companyActivity.IT, description: "it company", vacanciesList: [qa, dis], contacts: "gg")
        let comps: [company] = [sber, gg]
    
        let AndOl228 = candidate(name: "Andrey", activity: companyActivity.Banking, profession: profession.QA, level: level.junior, salary: 100000, skills: ["postit'sya"])
        
        
        printVac(comps: comps, candidate: AndOl228)
    }
}
