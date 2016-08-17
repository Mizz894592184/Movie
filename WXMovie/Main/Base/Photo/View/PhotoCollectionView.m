//
//  PhotoCollectionView.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"
@implementation PhotoCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.pagingEnabled = YES;
                
        //注册
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"Photo_cell"];
        
    }
    
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.array.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    

    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo_cell" forIndexPath:indexPath];
    
     cell.url = self.array[indexPath.item];
    
    return cell;
    
}

//结束显示cell的时候
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    //将cell上的scrollview的缩放倍数设为1.0
    
    
    UIScrollView *scrollView = (UIScrollView *)[cell viewWithTag:1000];
    scrollView.zoomScale = 1.0;
    
}

@end
