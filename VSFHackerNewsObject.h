//
//  VSFHackerNewsObject.h
//  NewsForHackers
//
//  Created by vincentsfong on 5/14/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSFHackerNewsObject : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) UIImage *img;

-(void) getLargestImage;
@end
