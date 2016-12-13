//
//  DropDownViewController.m
//  DropDownMenu
//
//  Created by Erica Winberry on 12/12/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "DropDownViewController.h"

CGFloat kStackVCWidthMultiplier = 0.3; // percentage of view; value of 0.0 to 1.0

@interface DropDownViewController ()
@property(strong, nonatomic) NSArray *viewControllers;
@property(strong, nonatomic) UIViewController *topViewController;
@property(strong, nonatomic) UIViewController *stackViewController;

@end

@implementation DropDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewControllers];
    
    self.topViewController = self.viewControllers.firstObject;
    
    [self setupStackMenu];

}

-(void)setupViewControllers {
    
    UIStoryboard *deerSB = [UIStoryboard storyboardWithName:@"Deer" bundle:nil];
    UIStoryboard *foxSB = [UIStoryboard storyboardWithName:@"Fox" bundle:nil];
    UIStoryboard *raccoonSB = [UIStoryboard storyboardWithName:@"Raccoon" bundle:nil];
    UIStoryboard *snekSB = [UIStoryboard storyboardWithName:@"Snek" bundle:nil];
    UIStoryboard *tigerSB = [UIStoryboard storyboardWithName:@"Tiger" bundle:nil];
    
    UIViewController *deerVC = [deerSB instantiateViewControllerWithIdentifier:@"DeerViewController"];
    
    UIViewController *foxVC = [foxSB instantiateViewControllerWithIdentifier:@"FoxViewController"];
    
    UIViewController *raccoonVC = [raccoonSB instantiateViewControllerWithIdentifier:@"RaccoonViewController"];
    
    UIViewController *snekVC = [snekSB instantiateViewControllerWithIdentifier:@"SnekViewController"];
    
    UIViewController *tigerVC = [tigerSB instantiateViewControllerWithIdentifier:@"TigerViewController"];
    
    self.viewControllers = @[deerVC, foxVC, raccoonVC, snekVC, tigerVC];
    
    [self setupChildController:deerVC];
}

-(void)setupChildController:(UIViewController *)childVC {
    [self addChildViewController:childVC];
    
    childVC.view.frame = self.view.frame;
    
    [self.view addSubview:childVC.view];
    
    [childVC didMoveToParentViewController:self];
}

-(void)setupStackMenu {
    UIViewController *stackVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuStack"];
    
    CGFloat stackWidth = self.view.frame.size.width / kStackVCWidthMultiplier;
    
    CGFloat leftMargin = self.view.frame.size.width - stackWidth;
    
    self.stackViewController = stackVC;
    
    [self addChildViewController:stackVC];
    
//    CGRect frame = CGRectMake(leftMargin, 0.0, stackWidth, self.view.frame.size.height);
    
    stackVC.view.frame = self.view.frame;
    
    [self.view addSubview:stackVC.view];
    
    [stackVC didMoveToParentViewController:self];
    
}










@end
