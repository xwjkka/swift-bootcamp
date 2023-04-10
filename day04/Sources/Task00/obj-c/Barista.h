//
//  Barista.h
//  
//
//  Created by Jeanna Kristen on 3/18/23.
//

#import <Foundation/Foundation.h>

@class BaristaMachine;

@interface Barista: NSObject {
    NSString *name;
    NSString *firstName;
    int experience;
    
}

- (void)brew:(int)type;


@end
