import Foundation
import RealmSwift

class r: Object {
    @Persisted var name: String
    @Persisted var steps: String
    @Persisted var img: String
}


func read(all: Results<r>) {
    for item in all {
        print("Name: \(item.name)")
        print("steps: \(item.steps)")
        print("url: \(item.img)\n")
    }
    print("---------------------------")
}

func delete(all: Realm, item: r) {
    try! all.write {
        all.delete(item)
    }
}

func update(realm: Realm, all: Results<r>, value: String, key: String) {
    try! realm.write {
        allRecepies.first?.setValue(value, forKey: key)
    }
}

let kutab = r()
kutab.name = "Kutab"
kutab.steps = "Go to butyrka and buy"
kutab.img = "1.jpg"

let dodster = r()
dodster.name = "Pizaa"
dodster.steps = "Go to dodo and buy"
dodster.img = "2.jpg"

let realm = try! Realm()

try! realm.write {
    realm.add(kutab)
    realm.add(dodster)
}

let allRecepies = realm.objects(r.self)

read(all: allRecepies)

delete(all: realm, item: kutab)

read(all: allRecepies)

update(realm: realm, all: allRecepies, value: "Dodster", key: "name")

read(all: allRecepies)

try! realm.write {
    realm.deleteAll()
}
