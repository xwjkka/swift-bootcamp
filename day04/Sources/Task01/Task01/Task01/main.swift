//
//  main.swift
//  Task01
//
//  Created by Jeanna Kristen on 3/18/23.
//

import Foundation

func main() {
	let man = Barista()
	print("Choose barista:\n 1. Man\n 2. Machine\n")
		  
	guard let input = readLine() else { return }
	guard let new = Int(input) else { return }
	
	if new == 1 {
		
		print("Сhoose a coffee from the menu: \n1. Сappuccino 2$\n2. Americano 1,5$\n3. Latte 2,3$\n")
		guard let coffeeType = readLine() else { return }
		guard let coffee = Int32(coffeeType) else { return }
		man.brew(coffee)
		
	} else if new == 2 {
		let machine = BaristaMachine()
		machine.brew()
		
		
	} else {
		main()
	}
	
}
main()
