//
//  ViewController.m
//  BridgingHeaderDemo
//
//  Created by Erica Winberry on 12/14/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "ViewController.h"
#import "BridgingHeaderDemo-Swift.h"

@interface ViewController ()

@property(strong, nonatomic) Student *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.student = [[Student alloc]initWithStudentID:@"123456" email:@"magic@magic.net" firstName:@"Shia" lastName:@"leBoeuf"];

    [self.student chewGum];
    [self.student talk];
    
}


@end
