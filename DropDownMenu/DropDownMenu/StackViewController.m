//
//  StackViewController.m
//  DropDownMenu
//
//  Created by Erica Winberry on 12/12/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "StackViewController.h"

NSTimeInterval kMenuShowHideItemsDuration = 0.3;

@interface StackViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *stackViews;

@property (weak, nonatomic) IBOutlet UIButton *burgerButton;

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIStackView *menuStack = [[UIStackView alloc]initWithArrangedSubviews:_stackViews];
    
//    for (UIView *stackItem in _stackViews) {
//        NSLog(@"Menu Item Present.");
//        [stackItem setHidden:NO];
//    }

    // Do any additional setup after loading the view.
}

-(void)toggleMenuItems {
    
    __weak typeof(self) bruce = self;
    [UIStackView animateWithDuration:kMenuShowHideItemsDuration animations:^{
        __strong typeof(bruce) hulk = bruce;
        
//        for (UIView *stackItem in hulk.stackViews) {
//            stackItem.hidden = !stackItem.hidden;
//        }
        
        for (UIView *stackItem in hulk.stackViews) {
            if (stackItem.hidden) {
                [stackItem setHidden:NO];
            } else {
                [stackItem setHidden:YES];
            }
        }

    } completion:^(BOOL finished) {
        __strong typeof(bruce) hulk = bruce;
        // do something here...
    }];
}

- (IBAction)burgerButtonPressed:(UIButton *)sender {
    NSLog(@"Burger pressed");
    for (UIView *stackItem in self.stackViews) {
        if (stackItem.hidden) {
            [stackItem setHidden:NO];
        } else {
            [stackItem setHidden:YES];
        }
    }
    // show all of the other buttons here.
}


- (IBAction)deerButtonPressed:(id)sender {
    // open deerVC
}

- (IBAction)foxButtonPressed:(id)sender {
    // open foxVC
}

- (IBAction)raccoonButtonPressed:(id)sender {
    // open raccoonVC
}

- (IBAction)snekButtonPressed:(id)sender {
    // open snekVC
}

- (IBAction)tigerButtonPressed:(id)sender {
    //open tigerVC
}




@end
