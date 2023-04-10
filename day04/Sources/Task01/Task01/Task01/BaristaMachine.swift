//
//  BaristaMachine.swift
//  Task01
//
//  Created by Jeanna Kristen on 3/18/23.
//

import Foundation

class BaristaMachine: NSObject {
    
    @objc var name: String?
    
    @objc func brew() {
        print("Сhoose a coffee from the menu: \n1. Сappuccino 1.8$\n2. Americano 1,35$\n3. Latte 2,05$\n")
        
        guard let kek = readLine() else { return }
        
        print("Coffee is brewing. One minute - time left")
        sleep(5)
        print("Coffee is ready!")
    }
    
}
