//
//  PosterView.m
//  WXMovie
//
//  Created by bing on 16/7/20.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "PosterView.h"
#import "Common.h"
#import "MovieModel.h"
#import "LargeCell.h"
#import "SmallCollectionView.h"
@implementation PosterView

-(void)awakeFromNib{
}

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
    
        [self _createLargeCollectionView];
        
        [self _createMaskView];
        
        [self _createHeaderView];
        
        [self _createSwipe];
        
        [self _createFooterView];
        
        //设置KVO的监听者
        
        [smallCollectionV addObserver:self
                           forKeyPath:@"currentIndex" //监听的属性
                              options:NSKeyValueObservingOptionNew context:nil];
        
        [largeCollectionView addObserver:self
                           forKeyPath:@"currentIndex" //监听的属性
                              options:NSKeyValueObservingOptionNew context:nil];
        
        
        
    }
    
    return self;
}

#pragma mark - create UI
-(void)_createFooterView{

    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KScreenHeight-49-64-50, KScreenWidth, 40)];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = [UIFont systemFontOfSize:24];
    
    titleLabel.textColor = [UIColor whiteColor];
     titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    
    [self addSubview:titleLabel];
    
    
    

}

//创建轻扫手势
-(void)_createSwipe{

    swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipe];
    
    
}
//创建遮罩视图
-(void)_createMaskView{

    maskView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    maskView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    maskView.hidden = YES;
    
    [maskView addTarget:self action:@selector(maskViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:maskView];
    
    
    
    
}
//创建头部视图
-(void)_createHeaderView{

//    1 父视图
    headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -KMovieHeaderViewHeight+30, KScreenWidth, KMovieHeaderViewHeight)];
    //可以结束响应时间
    headerView.userInteractionEnabled = YES;
    UIImage *image = [UIImage imageNamed:@"indexBG_home@2x"];
    
   
    //左边的宽度LeftCapWidth
    //上边的高度topCapHeight
    UIImage *stretchImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
     headerView.image =stretchImage;
    
    [self addSubview:headerView];
    
    //2 button按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 2001;
    button.frame = CGRectMake((KScreenWidth-20)/2, KMovieHeaderViewHeight-20, 20, 20);
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(showOrHideButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    
    //3 小海报视图
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, KMovieHeaderViewHeight-30);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10;
    
    
    smallCollectionV = [[SmallCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KMovieHeaderViewHeight-30) collectionViewLayout:flowLayout];
    smallCollectionV.backgroundColor = [UIColor clearColor];
    
    
    [headerView addSubview:smallCollectionV];
    
    
    
    
    
    
   
}

-(void)_createLargeCollectionView{
    
    
    //布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(KScreenWidth-100, self.height-100);
    flowLayout.minimumLineSpacing = 30;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
 
    CGRect frame = CGRectMake(0, 50, KScreenWidth, self.height-50-50);
    //创建集合视图
    largeCollectionView = [[LargeCollectionView alloc]initWithFrame: frame collectionViewLayout:flowLayout];
    
    
    [self addSubview:largeCollectionView];

    


}

#pragma mark - set方法
-(void)setData:(NSArray *)data{

    _data = data;
    
    smallCollectionV.data = self.data;
    largeCollectionView.data = self.data;
    
    MovieModel *model =  self.data[0];
    
    titleLabel.text = model.title;
    
    
}

#pragma mark - UIbutton Action
-(void)swipeAction:(UISwipeGestureRecognizer*)swipe{

    if (maskView.hidden == YES) {
        
        [self showheaderView];

    }else{
    
        [self hideHeaderView];
        
    }
    
    
}

-(void)maskViewAction:(UIControl*)maskView{

    [self hideHeaderView];
}

-(void)hideHeaderView{

    [UIView animateWithDuration:0.35 animations:^{
    
        //恢复转换之前的效果
        headerView.transform = CGAffineTransformIdentity;
        maskView.hidden = YES;
        
        //button的selected值切换
        
        UIButton *btn = [headerView viewWithTag:2001];
        btn.selected = !btn.selected;
        
    }];
    
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    
}
-(void)showheaderView{
    
    [UIView animateWithDuration:0.35 animations:^{
    
        headerView.transform = CGAffineTransformMakeTranslation(0, KMovieHeaderViewHeight-30);
        
        maskView.hidden = NO;
        
        //button的selected值切换
        
        UIButton *btn = [headerView viewWithTag:2001];
        btn.selected = !btn.selected;
    }];
    
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    
}
-(void)showOrHideButtonAction:(UIButton*)btn{

    if (btn.selected) {
        
        [self hideHeaderView];
        
    }else{
    
        [self showheaderView];
        
    }
//    btn.selected = !btn.selected;
    
    
}


#pragma mark - KVO
//kvo的属性值一变化就调用该方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSInteger index = [[change objectForKey:@"new"]integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if ([object isKindOfClass:[smallCollectionV class]]&& largeCollectionView.currentIndex != index) {
        
        [largeCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }else if ([object isKindOfClass:[largeCollectionView class]]&& smallCollectionV.currentIndex !=index){
    
         [smallCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    
    
    
    
    MovieModel *model = self.data[index];
    
    titleLabel.text =model.title;
    
 
}

//kVO对象的移除
-(void)dealloc{

    
    [smallCollectionV removeObserver:self forKeyPath:@"currentIndex"];
    
}



@end
