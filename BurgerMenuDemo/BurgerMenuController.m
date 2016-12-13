//
//  BurgerMenuController.m
//  BurgerMenuDemo
//
//  Created by Erica Winberry on 12/12/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "BurgerMenuController.h"

CGFloat kBurgerOpenScreenThreshold = 0.33; // percentage of view; value of 0.0 to 1.0
CGFloat kBurgerMenuWidth = 0.5; // percentage of view; value of 0.0 to 1.0

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
    
    [self setupChildController:menuTableController];
    [self setupChildController:firstVC];
    
    menuTableController.tableView.delegate = self;
    
    [self setupBurgerButton];
    [self setupPanGesture];
    
}

// MARK: Setup Methods

-(void)setupChildController:(UIViewController *)childVC {
    [self addChildViewController:childVC];
    
    childVC.view.frame = self.view.frame;
    
    [self.view addSubview:childVC.view];
    
    [childVC didMoveToParentViewController:self];
}

-(void)setupBurgerButton {
    
    CGFloat padding = 20.0;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(padding, padding, kBurgerImageWidth, kBurgerImageHeight)];
    
    [button setImage:[UIImage imageNamed:@"burger"] forState:UIControlStateNormal];
    
    [self.topViewController.view addSubview:button];
    
    [button addTarget:self action:@selector(burgerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.burgerButton = button;
}


-(void)setupPanGesture {
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(topViewControllerPanned:)];
    [self.topViewController.view addGestureRecognizer:self.panGesture];
}

// MARK: Actions

-(void)burgerButtonPressed:(UIButton *)sender {
    
    __weak typeof(self) bruce = self;
    [UIView animateWithDuration:kAnimationSlideMenuOpenTime animations:^{
        
        __strong typeof(bruce) hulk = bruce;
        hulk.topViewController.view.center = CGPointMake(hulk.view.center.x / kBurgerMenuWidth, hulk.view.center.y);
        
    } completion:^(BOOL finished) {
        __strong typeof(bruce) hulk = bruce;
        
        UITapGestureRecognizer *tapToClose = [[UITapGestureRecognizer alloc]initWithTarget:hulk action:@selector(tapToCloseMenu:)];
        
        [hulk.topViewController.view addGestureRecognizer:tapToClose];
        
        sender.userInteractionEnabled = NO;
        
    }];
}

-(void)tapToCloseMenu:(UITapGestureRecognizer *)sender {
    [self.topViewController.view removeGestureRecognizer:sender];
    
    __weak typeof(self) bruce = self;
    [UIView animateWithDuration:kAnimationSlideMenuOpenTime animations:^{
        __strong typeof(bruce) hulk = bruce;
        
        hulk.topViewController.view.center = hulk.view.center;
        
    } completion:^(BOOL finished) {
        __strong typeof(bruce) hulk = bruce;
        
        hulk.burgerButton.userInteractionEnabled = YES;
    }];
}

-(void)topViewControllerPanned:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.topViewController.view];
    CGPoint translation = [sender translationInView:self.topViewController.view];
    
//    NSLog(@"Velocity: %f", velocity.x);
//    NSLog(@"Translation: %f", translation.x);
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        if (translation.x >= 0) {
            self.topViewController.view.center = CGPointMake(self.topViewController.view.center.x + translation.x, self.view.center.y);
            
            [sender setTranslation:CGPointZero inView:self.topViewController.view];
        }
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        __weak typeof(self) bruce = self;
        
        if (self.topViewController.view.frame.origin.x > (self.view.frame.size.width * kBurgerOpenScreenThreshold)) {
            
            
            [UIView animateWithDuration:kAnimationSlideMenuOpenTime animations:^{
                __strong typeof(bruce) hulk = bruce;
                
                hulk.topViewController.view.center = CGPointMake(hulk.view.center.x / kBurgerMenuWidth, hulk.view.center.y);
                
            } completion:^(BOOL finished) {
                __strong typeof(bruce) hulk = bruce;

                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:hulk action:@selector(tapToCloseMenu:)];
                
                [hulk.topViewController.view addGestureRecognizer:tapGesture];
                
                hulk.burgerButton.userInteractionEnabled = NO;
            }];
        } else {
            
            [UIView animateWithDuration:kAnimationSlideMenuOpenTime animations:^{
                __strong typeof(bruce) hulk = bruce;
                
                hulk.topViewController.view.center = hulk.view.center;

            }];
        }
    }
}

// MARK: UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *newTopVC = self.viewControllers[indexPath.row];
    
    __weak typeof(self) bruce = self;
    
    [UIView animateWithDuration:kAnimationSlideMenuOpenTime animations:^{
        __strong typeof(bruce) hulk = bruce;
        
        hulk.topViewController.view.frame = CGRectMake(hulk.view.frame.size.width, hulk.view.frame.origin.y, hulk.view.frame.size.width, hulk.view.frame.size.height);

    } completion:^(BOOL finished) {
        __strong typeof(bruce) hulk = bruce;

        CGRect oldFrame = hulk.topViewController.view.frame;
        
        [hulk.topViewController willMoveToParentViewController:nil];
        [hulk.topViewController.view removeFromSuperview];
        [hulk.topViewController removeFromParentViewController];
        
        [hulk setupChildController:newTopVC];
        newTopVC.view.frame = oldFrame;
        
        hulk.topViewController = newTopVC;
        
        [hulk.burgerButton removeFromSuperview];
        [hulk.topViewController.view addSubview:hulk.burgerButton];
        
        [UIView animateWithDuration:kAnimationSlideMenuClosedTime animations:^{
            hulk.topViewController.view.frame = hulk.view.frame;
            
        } completion:^(BOOL finished) {
            [hulk.topViewController.view addGestureRecognizer:hulk.panGesture];
            hulk.burgerButton.userInteractionEnabled = YES;
        }];
        
        
    }];
    
}


@end
