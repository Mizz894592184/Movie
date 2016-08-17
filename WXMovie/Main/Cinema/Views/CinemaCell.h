//
//  CinemaCell.h
//  WXMovie
//
//  Created by bing on 16/7/29.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"
@interface CinemaCell : UITableViewCell
{

    IBOutlet UILabel *cinemaName;
    
    IBOutlet UILabel *cinemaAddress;
    IBOutlet UILabel *ratingLabel;
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *distranceLabel;
    
    IBOutlet UIImageView *q_image;
    IBOutlet UIImageView *t_image;
    IBOutlet UIImageView *z_image;
    IBOutlet UIImageView *iMax_image;
}
@property(nonatomic,strong)CinemaModel *model;

@end
