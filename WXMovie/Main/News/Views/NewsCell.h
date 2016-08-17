//
//  NewsCell.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
{

    IBOutlet UIImageView *ImageView;
    
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *SummanyLabel;
    IBOutlet UIImageView *typeImageV;
}

@property(nonatomic,strong)NewsModel *model;


@end
