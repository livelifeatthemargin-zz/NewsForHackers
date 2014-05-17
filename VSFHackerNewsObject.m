//
//  VSFHackerNewsObject.m
//  NewsForHackers
//
//  Created by vincentsfong on 5/14/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFHackerNewsObject.h"
#import "TFHpple.h"

@implementation VSFHackerNewsObject

@synthesize title = _title;
@synthesize url = _url;
@synthesize img = _img;

- (void) getLargestImage {
    
    
    
    NSData *dataFromHNObject = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.url]];
    
    TFHpple *hnObjectParser = [TFHpple hppleWithHTMLData:dataFromHNObject];
    
    NSString *hnObjectsXpathQueryString = @"//meta[@property='og:image']";
    NSArray *hnObjectImageNodes = [hnObjectParser searchWithXPathQuery:hnObjectsXpathQueryString];
    //NSMutableArray *hnImages = [[NSMutableArray alloc] initWithCapacity:0];
    //UIImage *theImage = [[UIImage alloc] init];
    
    for (TFHppleElement *element in hnObjectImageNodes) {
        NSString *imageURL = [element objectForKey:@"content"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
        UIImage *tmpImg =[[UIImage alloc] initWithData:imageData];
        _img = tmpImg;
            
}
    
    
    
    
    
    
    
    
    
}

@end
