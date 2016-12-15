//
//  Person.h
//  BridgingHeaderDemo
//
//  Created by Erica Winberry on 12/14/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong, nonatomic) NSString  * _Nonnull firstName;
@property(strong, nonatomic) NSString  * _Nonnull lastName;

// make properties nonnull so don't show up as optional.
- (instancetype)initWithFirstName:(NSString * _Nonnull)firstName lastName:(NSString * _Nonnull)lastName;

-(void)walk;
-(void)talk;

@end
