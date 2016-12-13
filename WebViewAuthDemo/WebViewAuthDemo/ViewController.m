//
//  ViewController.m
//  WebViewAuthDemo
//
//  Created by Erica Winberry on 12/13/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

@import WebKit;

#import "ViewController.h"

NSString *kBaseURL = @"https://stackexchange.com/oauth/dialog";
NSString *kRedirectURI = @"https://stackexchange.com/oauth/login_success";
NSString *kClientID = @"8613";

@interface ViewController () <WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WKWebView *webView = [[WKWebView alloc]init];
    
    // take up the whole frame
    webView.frame = self.view.frame;
    
    [self.view addSubview:webView];
    
    // sets this VC as delegate for any navigation actions in the webview.
    webView.navigationDelegate = self;
    
    NSURL *authURL = [self createStackOverflowAuthURL];
    
    [webView loadRequest:[NSURLRequest requestWithURL:authURL]];

}

//helper method

-(NSURL *)createStackOverflowAuthURL {
    
    // create url with the needed parameters (check docs). Could also do this using URL components.
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",
                           kBaseURL,
                           kClientID,
                           kRedirectURI];
    
    return [[NSURL alloc]initWithString:urlString];
}

// MARK: WKNavigationDelegate Methods

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    // check to make sure that the response from stack exchange is coming from the appropriate redirect URI (successful auth)
    if ([navigationAction.request.URL.path isEqualToString:@"/oauth/login_success"]) {
        NSLog(@"IS TOKEN IN STRING? : %@",navigationAction.request.URL.absoluteString);
        
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
    
}










@end
