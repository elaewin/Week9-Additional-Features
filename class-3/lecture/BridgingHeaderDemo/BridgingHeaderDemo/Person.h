//
//  Person.h
//  BridgingHeaderDemo
//
//  Created by Adam Wallraff on 12/14/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong, nonatomic)  NSString  * _Nonnull firstName;
@property(strong, nonatomic) NSString * _Nonnull lastName;

-(void)walk;
-(void)talk;


-(instancetype)initWithFirstName:(NSString * _Nonnull)firstName lastName:(NSString * _Nonnull)lastName;


@end
