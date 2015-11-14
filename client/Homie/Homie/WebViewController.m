//
//  WebViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "WebViewController.h"

@import WebKit;

@interface WebViewController ()
@property (nonatomic, readwrite, strong) NSString *url;
@property (nonatomic, readwrite, strong) WKWebView *webView;
@end

@implementation WebViewController

- (id)initWithURLString: (NSString *)url
{
    self = [super init];
    if (self)
    {
        _url = url;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
//    self.webView.navigationDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

#pragma property

- (WKWebView *)webView
{
    if (_webView == nil)
    {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.allowsBackForwardNavigationGestures = YES;
    }
    return _webView;
}

@end
