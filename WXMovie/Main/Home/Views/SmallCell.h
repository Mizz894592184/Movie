//
//  SmallCell.h
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface SmallCell : UICollectionViewCell
{

    UIImageView *iamgeV;
}
@property(nonatomic,strong)MovieModel *model;

@end
