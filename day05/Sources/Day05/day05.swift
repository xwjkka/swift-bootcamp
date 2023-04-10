import Foundation
import RxCocoa
import RxSwift

// Ex. 1
func filterByChar() {
    let filteredObservable = firstCollection.filter { $0.contains("e") }

    _ = filteredObservable.subscribe {
        print(String($0))
    }.disposed(by: bag)
}

// Ex.2
func filterFirstSubstringElement() {
    let mapedObservable = firstCollection.skip{ !$0.hasPrefix("th")}
       .take(1)

    _ = mapedObservable.subscribe {
        print(String($0))
    }.disposed(by: bag)
}

// Ex. 3
func ifAllLongerThanLength() {
    let filteredObservable = firstCollection.map{ Bool($0.count > 5) }
        .reduce(true) { $0 && $1}

    _ = filteredObservable.subscribe {
        print(Bool($0))
    }.disposed(by: bag)
}

// Ex. 4
func ifSomeLongerThanLength() {
    let filteredObservable = firstCollection.map{ Bool($0.count > 5) }
        .reduce(false) { $0 || $1}

    _ = filteredObservable.subscribe {
        print(Bool($0))
    }.disposed(by: bag)
}

// Ex. 5
func ifEmptyString() {
    let filteredObservable = firstCollection.map{ Bool($0.count == 0) }
        .reduce(false) { ($0 || $1)}

    _ = filteredObservable.subscribe {
        print(Bool($0))
    }.disposed(by: bag)
}

// Ex. 6
func commonLength() {
    let filteredObservable = firstCollection.map{ $0.count } 
            .reduce(0) { $0 + $1 }

    _ = filteredObservable.subscribe {
        print(Int($0))
    }.disposed(by: bag)
}

// Ex. 7
func countStrings() {
    let filteredObservable = firstCollection.map{ _ in
        1}
        .reduce(0) { $0 + $1 }

    _ = filteredObservable.subscribe {
        print(Int($0))
    }.disposed(by: bag)
}


// Ex.8
func fetchStrings() -> [String] {
    let filteredObservable = firstCollection

    var tempArr : [String] = []

    _ = filteredObservable.subscribe {
        tempArr.append($0)
    }.disposed(by: bag)

    return tempArr
}

// Ex.9
func groupByID() {
    let _ = secondCollection.groupBy { $0.id }
        .flatMap{ 
            $0.map {
                $0.text
            }
            .toArray()
        }
        .subscribe {
            print([String]($0))

    }.disposed(by: bag)

}


@main

public struct Day05 {

    public static func main() {
        
        print("---- Exercise 1 ----")
        filterByChar()
        print("---- Exercise 2 ----")
        filterFirstSubstringElement()
        print("---- Exercise 3 ----")
        ifAllLongerThanLength()
        print("---- Exercise 4 ----")
        ifSomeLongerThanLength()
        print("---- Exercise 5 ----")
        ifEmptyString()
        print("---- Exercise 6 ----")
        commonLength()
        print("---- Exercise 7 ----")
        countStrings()
        print("---- Exercise 8 ----")
        let arrStr = fetchStrings()
        print(arrStr)
        print("---- Exercise 9 ----")
        groupByID()
    }
}
