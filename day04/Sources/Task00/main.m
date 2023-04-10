//
//  main.m
//  
//
//  Created by Jeanna Kristen on 3/18/23.
//

#import <Foundation/Foundation.h>
#import "obj-c/Coffee.h"
#import "obj-c/Barista.h"

int initCoffee(int result) {
    
    @autoreleasepool {
        // создание экземпляра Person
        id coffee = [[Coffee alloc] init];
        id barista = [[Barista alloc] init];
        [barista brew:result];
    }
        
}

int main () {
    
    int result = 0;
    
    NSString *welcomeMessage = @"\nСhoose a coffee from the menu: \n1. Сappuccino 2$\n2. Americano 1,5$\n3. Latte 2,3$\n";
    
    printf("%s", "\n");
   
    NSLog(@"%@", welcomeMessage);
    
    if (scanf("%d", &result) != 1) { printf("Fucking tester, write integer!\n"); return 0; }
    
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



