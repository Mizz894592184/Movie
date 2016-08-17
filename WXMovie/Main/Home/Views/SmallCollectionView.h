//
//  SmallCollectionView.h
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSArray *data;//数据

@property(nonatomic,assign)NSInteger currentIndex;//当前的页数

@end
