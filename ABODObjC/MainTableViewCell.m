//
//  MainTableViewCell.m
//  ABODObjC
//
//  Created by Kawika Avilla on 4/24/16.
//  Copyright © 2016 kawikaavilla. All rights reserved.
//

#import "MainTableViewCell.h"
#import "UIImageView+AFNetworking.h"

#define fontFamilyMed @"Avenir-Medium"
#define fontFamily @"Avenir"

@implementation MainTableViewCell

@synthesize priceRangeLabel, bedRangeLabel, propertyNameLabel, tileView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        priceRangeLabel = [[UILabel alloc]init];
        [priceRangeLabel setFont:[UIFont fontWithName:fontFamilyMed size:20]];
        [priceRangeLabel setTextColor:[UIColor whiteColor]];
        [priceRangeLabel setBackgroundColor:[UIColor colorWithRed:32.0/255
                                                            green:32.0/255
                                                             blue:32.0/255
                                                            alpha:0.85]];
        bedRangeLabel = [[UILabel alloc]init];
        [bedRangeLabel setFont:[UIFont fontWithName:fontFamilyMed size:18]];
        
        propertyNameLabel = [[UILabel alloc]init];
        [propertyNameLabel setTextColor:[UIColor grayColor]];
        [propertyNameLabel setFont:[UIFont fontWithName:fontFamily size:14]];
        
        tileView = [[UIImageView alloc]init];
        [self.contentView addSubview:tileView];
        [self.contentView addSubview:priceRangeLabel];
        [self.contentView addSubview:bedRangeLabel];
        [self.contentView addSubview:propertyNameLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat contentBoundX= contentRect.origin.x;
    CGRect frame;
    
    frame = CGRectMake(contentBoundX, 0, contentRect.size.width, 200);
    tileView.frame = frame;
    CGFloat tileViewHeight = tileView.frame.size.height;
    
    CGSize expectedWidth = priceRangeLabel.intrinsicContentSize;
    frame = CGRectMake(contentBoundX, (tileViewHeight - 35), (expectedWidth.width + 20), 30);
    priceRangeLabel.textAlignment = NSTextAlignmentCenter;
    priceRangeLabel.frame = frame;
    
    frame= CGRectMake(contentBoundX + 10 , (tileViewHeight + 12.5), (contentRect.size.width - 10), 15);
    bedRangeLabel.frame = frame;
    
    frame= CGRectMake(contentBoundX + 10 , (tileViewHeight + 35), (contentRect.size.width - 10), 15);
    propertyNameLabel.frame = frame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

