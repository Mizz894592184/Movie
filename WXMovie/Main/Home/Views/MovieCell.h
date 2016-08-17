//
//  MovieCell.h
//  WXMovie
//
//  Created by bing on 16/7/19.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
#import "StarView.h"
@interface MovieCell : UITableViewCell
{

    IBOutlet UIImageView *posterView;
    IBOutlet UILabel *titleLabel;
    IBOutlet StarView *starView;
    IBOutlet UILabel *gradeLabel;
    IBOutlet UILabel *yearLabel;
}

@property(nonatomic,strong)MovieModel *model;

@end
