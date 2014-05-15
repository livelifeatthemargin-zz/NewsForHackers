//
//  VSFDetailViewController.m
//  NewsForHackers
//
//  Created by vincentsfong on 5/14/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFDetailViewController.h"
#import "VSFHackerNewsObject.h"

@interface VSFDetailViewController ()
- (void)configureView;
@end

@implementation VSFDetailViewController
@synthesize webView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(VSFHackerNewsObject *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.url;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    webView = [[UIWebView alloc] initWithFrame:screenRect];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setDelegate:self];
    [webView setScalesPageToFit:YES];
    [self.view addSubview:webView];
   
    
    
    NSURL *url = [NSURL URLWithString:_detailItem.url];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"testFile.pdf" ofType:nil];
    //NSURL *url = [NSURL fileURLWithPath:path];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
