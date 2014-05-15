//
//  VSFDetailViewController.h
//  NewsForHackers
//
//  Created by vincentsfong on 5/14/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSFHackerNewsObject.h"

@interface VSFDetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) VSFHackerNewsObject *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, retain) UIWebView *webView;
@end
