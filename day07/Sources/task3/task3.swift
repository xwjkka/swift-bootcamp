//
//  File.swift
//  
//
//  Created by Olesya Khurmuzakiy on 23.03.2023.
//

import Foundation
import Alamofire

@main
public struct task3 {
    struct Flights: Decodable {
        var array: [flight]
    }

    struct flight: Decodable {
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

    static func load(completion: @escaping (_ result: Bool, _ json: Flights?) -> ()) {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "resourceversion": "v4",
            "app_id": "df9d8e92",
            "app_key": "315c1afdca5a52cbe22b720d9f83f773"
        ]

        AF.request("https://api.schiphol.nl/public-flights/flights",
                   method: .get,
                   headers: headers).responseDecodable(of: Flights.self) { response in
            switch response.result {
                case .success(let data):
                    completion(true, data)
                case .failure:
                    completion(false, nil)
            }
        }
    }
    
    public static func main() {
        var finished: Bool = false

        load(completion: { result, json in
            if result {
                dump(json!)
            } else {
                print("nil")
            }
            finished = true
        })
        //
        while !finished {
            RunLoop.current.run(mode: .default, before: .distantFuture)
        }

    }

}
