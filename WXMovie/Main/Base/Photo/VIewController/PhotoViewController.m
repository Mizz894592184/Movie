//
//  PhotoViewController.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
#import "Common.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(backAction:)];
    
    
    self.navigationItem.leftBarButtonItem = item;
    
    [self createPhotoCollectionView];
    
    // Do any additional setup after loading the view.
}
-(void)createPhotoCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;//行间距
    

    PhotoCollectionView *photoCollectionV = [[PhotoCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    
    
    [self.view addSubview:photoCollectionV];
    
    photoCollectionV.array = self.imageArray;
    
    
    //滚动到指定的indexPath位置
    [photoCollectionV scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];//ScrollPosition:滚动的位置
    
    
    
}
-(void)backAction:(UIBarButtonItem*)item{

    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
