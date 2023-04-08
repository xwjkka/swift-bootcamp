import Foundation

func main() {
    guard let url = URL(string: "https://api.schiphol.nl/public-flights/flights") else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = ["app_id": "df9d8e92", "app_key": "315c1afdca5a52cbe22b720d9f83f773", "ResourceVersion": "v4", "Accept" : "application/json"]
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {return}
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                guard let names = json["flights"] as? Array<AnyObject> else {
                    return
                }
                var flightsArray: [flight] = []
                for item in names {
                    let f = flight(lastUpdatedAt: item["lastUpdatedAt"] as? String, actualLandingTime: item["actualLandingTime"] as? String,
                                   actualOffBlockTime: item["actualOffBlockTime"] as? String, flightDirection: item["flightDirection"] as? String,
                                   flightName: item["flightName"] as? String, flightNumber: item["flightNumber"] as? Int,
                                   gate: item["gate"] as? String, pier: item["pier"] as? String,
                                   id: item["id"] as? String, terminal: item["terminal"] as? Int)
                    flightsArray.append(f)
                }
                for i in flightsArray {
                    print(i)
                }
            } else { print(3) }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    task.resume()
}

struct flight {
    var lastUpdatedAt: String?
    var actualLandingTime: String?
    var actualOffBlockTime: String?
    var flightDirection: String?
    var flightName: String?
    var flightNumber: Int?
    var gate: String?
    var pier: String?
    var id: String?
    var terminal: Int?
}

main()
dispatchMain()
