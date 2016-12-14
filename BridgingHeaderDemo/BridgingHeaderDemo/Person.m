//
//  Person.m
//  BridgingHeaderDemo
//
//  Created by Erica Winberry on 12/14/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString * _Nonnull)firstName lastName:(NSString * _Nonnull)lastName {

    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

-(void)walk {
    NSLog(@"%@ is walking", self.firstName);
}

-(void)talk{
    NSLog(@"%@ is talking about stuff...", self.firstName);
}


@end
