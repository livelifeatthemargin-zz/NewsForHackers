//
//  VSFTableViewCell.m
//  NewsForHackers
//
//  Created by vincentsfong on 5/16/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFTableViewCell.h"

@implementation VSFTableViewCell
@synthesize title = _title;
@synthesize url = _url;
@synthesize hnImage = _hnImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
