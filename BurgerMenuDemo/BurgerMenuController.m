//
//  BurgerMenuController.m
//  BurgerMenuDemo
//
//  Created by Erica Winberry on 12/12/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "BurgerMenuController.h"

CGFloat kBurgerOpenScreenThreshold = 0.33; // percentage of view; value of 0.0 to 1.0
CGFloat kBurgerOpenScreenWidth = 0.5; // percentage of view; value of 0.0 to 1.0

CGFloat kBurgerImageWidth = 50.0; // width of burger button
CGFloat kBurgerImageHeight = 50.0; // height of burger button

NSTimeInterval kAnimationSlideMenuOpenTime = 0.25; // how long it takes to slide out menu
NSTimeInterval kAnimationSlideMenuClosedTime = 0.15; // how long to close menu

@interface BurgerMenuController () <UITableViewDelegate>

@property(strong, nonatomic) NSArray *viewControllers;
@property(strong, nonatomic) UIViewController *topViewController; // VC user is currently seeing

@property(strong, nonatomic) UIButton *burgerButton;
@property(strong, nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation BurgerMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController *firstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
    
    UIViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    
    self.viewControllers = @[firstVC, secondVC];
    
    self.topViewController = self.viewControllers.firstObject;
    
    UITableViewController *menuTableController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuTable"];
    
    menuTableController.tableView.delegate = self;

}

// MARK: UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // come back to this.
}


@end
