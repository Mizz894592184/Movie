//
//  TopViewController.h
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>



@property (strong, nonatomic) IBOutlet UICollectionView *topCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,strong)NSMutableArray *data;

@end
