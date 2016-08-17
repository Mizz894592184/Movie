//
//  SmallCollectionView.m
//  WXMovie
//
//  Created by bing on 16/7/26.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "SmallCollectionView.h"
#import "SmallCell.h"
#import "MovieModel.h"
#import "Common.h"
@implementation SmallCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.showsHorizontalScrollIndicator = NO;
        
        [self registerClass:[SmallCell class] forCellWithReuseIdentifier:@"smallCell_ID"];
        
        
    }
    return self;
}
#pragma mark - dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SmallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"smallCell_ID" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor whiteColor];
    
    MovieModel *model =  self.data[indexPath.item];
    
    cell.model = model;
    
    
    return cell;
    
    
}


//每一组的偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0,(KScreenWidth-80)/2 , 0, (KScreenWidth-80)/2);
    
    
}

//对齐单元格
#pragma mark - UIScorllView Delegate
//将要结束拖拽(手指离开屏幕的的那一刻)
//该方法需要将pagingEnabled关掉才可以使用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSLog(@"---------");
    NSLog(@"滑动的速度%lf",velocity.x);
    //    char a;
    //    char *b;
    NSLog(@"松手时x方向的偏移量:%lf",scrollView.contentOffset.x);
    //targetContentOffset是个指针,可以修改参数.
    NSLog(@"目标的最终的偏移量:%lf",targetContentOffset->x);
    
    //1 根据偏移量判断一下应该显示第几个item
    CGFloat offSetX = targetContentOffset->x;
    
    CGFloat itemWidth =80;
    
    //item的宽度+行间距 = 页码的宽度
    NSInteger pageWidth = itemWidth+10;
    
    
    //根据偏移量 计算是 第几页
    NSInteger pageNum = (offSetX+pageWidth/2)/pageWidth;
    
    NSLog(@"pageNumber= %ld",pageNum);
    
    //2 根据显示的第几个item,从而改变偏移量
    targetContentOffset->x = pageNum*pageWidth;
    
    self.currentIndex = pageNum;
    
}

@end
