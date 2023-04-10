import Foundation
import Swinject

protocol a {
    var type: String? { get }
    var square: Int? { get }
    var location: String? { get }
    var isThereWolf: Bool? { get }
}

class Forest: a {
    let type: String?
    let square: Int?
    let location: String?
    let isThereWolf: Bool?
    
    init(type: String?, square: Int?, location: String?, isThereWolf: Bool?) {
        self.type = type
        self.square = square
        self.location = location
        self.isThereWolf = isThereWolf
    }
    
    func printCont() {
        print(self.type ?? 0, self.square ?? 0, self.location ?? 0, self.isThereWolf ?? 0)
    }
}


class NetworkService {
    
    func workGet() -> Container {
        let container = Container()
        container.register(a.self) {_ in Forest(type: "les", square: 98, location: "kk", isThereWolf: false)}
        return container
    }
}

class DbService {
    var data: a? = nil
    func workDb(_ container: Container)  {
        self.data = container.resolve(a.self)
    }
}

struct AppDependencies {
    var networkService: NetworkService
    var dbService: DbService
}

public class Contoller {
    var dbService: DbService
    var networkService: NetworkService
    
    init (container: AppDependencies) {
        self.dbService = container.dbService
        self.networkService = container.networkService
    }
    
    func request() {
        print(self.networkService.workGet().resolve(a.self)!.location ?? 0,      self.networkService.workGet().resolve(a.self)!.type ?? 0,
              self.networkService.workGet().resolve(a.self)!.square ?? 0,
              self.networkService.workGet().resolve(a.self)!.isThereWolf ?? 0)
    }
    
    func load() {
        
        let temp = self.networkService.workGet()
        self.dbService.workDb(temp)
        guard let toPrint = self.dbService.data else {
            print("Data not saved\n")
            return
        }
        print("Data was saved in table\n")
        //        toPrint.printInfo()
        
    }
}

func main() {
    
    let dependencies = AppDependencies(networkService: NetworkService(), dbService: DbService())
    let controller = Contoller(container: dependencies)
    
    controller.request()
    controller.load()
}

main()
