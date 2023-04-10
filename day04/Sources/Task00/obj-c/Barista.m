//
//  Barista.m
//  
//
//  Created by Jeanna Kristen on 3/18/23.
//

#import "Barista.h"

@implementation Barista

- (void) brew:(int)type {
    printf("%s", "Proccesing brewing coffee... \n");
    
    if (type == 1) {
        printf("%s", "Your Сappuccino is ready! \n");
    } else if (type == 2) {
        printf("%s", "Your Americano is ready! \n");
    } else {
        printf("%s", "Your Latte is ready!\n");
    }

}

@end

