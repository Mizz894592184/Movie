//
//  LargeCollectionView.m
//  WXMovie
//
//  Created by bing on 16/7/27.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "LargeCollectionView.h"
#import "LargeCell.h"
#import "Common.h"
@implementation LargeCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.hidden = NO;
        //    largeCollectionView.pagingEnabled = YES;//分页效果
        
        self.dataSource = self;
        self.delegate = self;
        
        self.showsHorizontalScrollIndicator = NO;
        //注册
        [self registerClass:[LargeCell class] forCellWithReuseIdentifier:@"collectionView_Cell"];
    }
    return self;
}


#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.data.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LargeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionView_Cell" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor redColor];
    
    
    MovieModel *model = self.data[indexPath.item];
    
    cell.model = model;
    
    return cell;
    
    
}

//每一组的偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 50, 0, 50);
    
    
}


//cell的点击方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //点击翻转
    
    LargeCell *cell = (LargeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell flipCell];
    
    
    
    
}

//结束显示cell的时候
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //重置正反面
    LargeCell *endcell = (LargeCell*)cell;
    
    [endcell restoreCell];
    
    
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
    
    CGFloat itemWidth =KScreenWidth-100;
    
    //item的宽度+行间距 = 页码的宽度
    NSInteger pageWidth = itemWidth+30;
    
    
    //根据偏移量 计算是 第几页
    NSInteger pageNum = (offSetX+pageWidth/2)/pageWidth;
    
    NSLog(@"pageNumber= %ld",pageNum);
    
    //2 根据显示的第几个item,从而改变偏移量
    targetContentOffset->x = pageNum*pageWidth;
    
    self.currentIndex = pageNum;
    
}

@end
