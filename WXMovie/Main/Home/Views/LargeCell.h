//
//  LargeCell.h
//  WXMovie
//
//  Created by bing on 16/7/20.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailView.h"
@class MovieModel;
@interface LargeCell : UICollectionViewCell
{

    UIImageView *imageV;
    MovieDetailView *detailView;
}
@property(nonatomic,strong)MovieModel *model;

//翻转视图
-(void)flipCell;
//重置视图
-(void)restoreCell;
@end
