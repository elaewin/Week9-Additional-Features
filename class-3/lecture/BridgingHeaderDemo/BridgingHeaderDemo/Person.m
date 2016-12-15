//
//  Person.m
//  BridgingHeaderDemo
//
//  Created by Adam Wallraff on 12/14/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString * _Nonnull)firstName lastName:(NSString * _Nonnull)lastName{

    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

-(void)walk{
    NSLog(@"I am walkin down the street...");
}


-(void)talk{
    NSLog(@"hello, what would you like to discuss??");
}


@end
