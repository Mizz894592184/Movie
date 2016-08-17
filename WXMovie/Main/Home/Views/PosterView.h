//
//  PosterView.h
//  WXMovie
//
//  Created by bing on 16/7/20.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallCollectionView.h"
#import "LargeCollectionView.h"
@interface PosterView : UIView{

    LargeCollectionView *largeCollectionView;//大海报
    SmallCollectionView *smallCollectionV;//小海报
    UIImageView *headerView;//头部视图
    UIControl *maskView;//遮罩视图
    UISwipeGestureRecognizer *swipe;//轻扫手势
    UILabel *titleLabel;//标题label
}


@property(nonatomic,strong)NSArray *data;

@end
