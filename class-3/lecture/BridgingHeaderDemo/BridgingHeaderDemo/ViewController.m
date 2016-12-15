//
//  ViewController.m
//  BridgingHeaderDemo
//
//  Created by Adam Wallraff on 12/14/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

#import "ViewController.h"

#import "BridgingHeaderDemo-Swift.h"


@interface ViewController ()

@property(strong, nonatomic) Student *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.student = [[Student alloc]initWithStudentID:@"kjh234kj" email:@"adam@codefellows.com" firstName:@"Adam" lastName:@"Wallraff"];
    
    [self.student chewGum];
    
    [self.student talk];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
