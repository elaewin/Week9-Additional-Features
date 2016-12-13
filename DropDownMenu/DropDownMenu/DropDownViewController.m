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
    
    
    

}

-(void)setupViewControllers {
    UIViewController *deerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DeerViewController"];
    
    UIViewController *foxVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FoxViewController"];
    
    UIViewController *raccoonVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RaccoonViewController"];
    
    UIViewController *snekVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SnekViewController"];
    
    UIViewController *tigerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TigerViewController"];
    
    self.viewControllers = @[deerVC, foxVC, raccoonVC, snekVC, tigerVC];
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
    
    stackVC.view.frame = CGRectMake(leftMargin, 0.0, stackWidth, self.view.frame.size.height);
    
    [self setupChildController:stackVC];
    
    self.stackViewController = stackVC;
    
    
}










@end
