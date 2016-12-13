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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *menuItems;
// create outlet for burger button!

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStackView *menuStack = [[UIStackView alloc]initWithArrangedSubviews:_menuItems];
    
    for (UIButton *button in _menuItems) {
        [button setHidden:YES];
    }

    // Do any additional setup after loading the view.
}

-(void)toggleMenuItems {
    
    __weak typeof(self) bruce = self;
    [UIStackView animateWithDuration:kMenuShowHideItemsDuration animations:^{
        __strong typeof(bruce) hulk = bruce;
        
//        for (UIButton *button in hulk.menuItems) {
//            button.hidden = !button.hidden;
//        }
        
        for (UIButton *button in hulk.menuItems) {
            if (button.hidden) {
                [button setHidden:NO];
            } else {
                [button setHidden:YES];
            }
        }

//    } completion:^(BOOL finished) {
//        __strong typeof(bruce) hulk = bruce;
//
    }];
}

- (IBAction)burgerButtonPressed:(UIButton *)sender {
    NSLog(@"Burger pressed");
    for (UIButton *button in self.menuItems) {
        if (button.hidden) {
            [button setHidden:NO];
        } else {
            [button setHidden:YES];
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
