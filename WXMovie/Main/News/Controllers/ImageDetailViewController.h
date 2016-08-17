//
//  ImageDetailViewController.h
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageDetailViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *ImageCollectionView;

@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *ImageFlowLayout;

@property(nonatomic,strong)NSMutableArray *data;

@end
