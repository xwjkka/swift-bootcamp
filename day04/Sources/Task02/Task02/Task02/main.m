//
//  main.m
//  Task02
//
//  Created by Jeanna Kristen on 3/18/23.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"
#import "Barista.h"
//Swift/Task02-Bridging-Header.h
#import "Task02-Swift.h"

int initCoffee(int result) {
    
    @autoreleasepool {
        // создание экземпляра Person
        id coffee = [[Coffee alloc] init];
        id barista = [[Barista alloc] init];
        [barista brew:result];
    }
    return 0;
}

int main () {
    
    int result = 0;
    int newResult = 0;
    
    printf("Choose barista:\n 1. Man\n 2. Machine\n");
    printf("%s", "\n");
    if (scanf("%d", &result) != 1) { printf("Wrong input\n"); return 0; }
    
    if (result == 2) {
        id new = [[BaristaMachine alloc] init];
        
        printf("Сhoose a coffee from the menu: \n1. Сappuccino 1.8$\n2. Americano 1,35$\n3. Latte 2,05$\n");
        scanf("%d", &newResult);
        [new brew];
        return 0;
    }

    printf( "\nСhoose a coffee from the menu: \n1. Сappuccino 2$\n2. Americano 1,5$\n3. Latte 2,3$\n");
    
    printf("%s", "\n");
   
    
    if (scanf("%d", &result) != 1) { printf("Wrong input\n"); return 0; }
    
    printf("%s", "\n");
    
    
    if (result == 1) {
        initCoffee(result);
        
    } else if (result == 2) {
        initCoffee(result);
        
    } else if (result == 3) {
        initCoffee(result);
        
    } else {
        printf("%s", "Try again! \n");
        main();
    }
}
