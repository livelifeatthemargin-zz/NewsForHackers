//
//  VSFTableViewCell.h
//  NewsForHackers
//
//  Created by vincentsfong on 5/16/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSFTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *url;
@property (nonatomic, weak) IBOutlet UIImageView *hnImage;


@end
