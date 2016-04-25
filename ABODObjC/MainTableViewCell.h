//
//  MainTableViewCell.h
//  ABODObjC
//
//  Custom cell for the table in the main view
//
//  Created by Kawika Avilla on 4/24/16.
//  Copyright © 2016 kawikaavilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
{
    UILabel *priceRangeLabel;
    UILabel *bedRangeLabel;
    UILabel *propertyNameLabel;
    UIImageView *tileView;
}
@property(nonatomic,retain)UILabel *priceRangeLabel;
@property(nonatomic,retain)UILabel *bedRangeLabel;
@property(nonatomic,retain)UILabel *propertyNameLabel;
@property(nonatomic,retain)UIImageView *tileView;

@end
