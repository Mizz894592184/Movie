//
//  ImageDetailViewController.m
//  WXMovie
//
//  Created by bing on 16/7/25.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "ImageNewsCell.h"
#import "Common.h"
#import "ImageModel.h"
#import "PhotoViewController.h"
#import "BaseNavigationController.h"
@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ImageFlowLayout.minimumLineSpacing = 30;
    self.ImageFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.ImageFlowLayout.itemSize = CGSizeMake((KScreenWidth-60)/3, (KScreenWidth-60)/3);
    
    self.ImageCollectionView.delegate = self;
    self.ImageCollectionView.dataSource = self;
    
    [self loadData];
    
    
    // Do any additional setup after loading the view.
}
-(void)loadData{

    NSArray *array = [DataService loadDataWithListName:@"image_list"];
    
    self.data = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        
        ImageModel *model = [[ImageModel alloc]init];
        
        [model setValueForAttributesWithDictionary:dic];
        
        [self.data addObject:model];
        
    }
    
    
    
}

#pragma mark - UICollection DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.data.count;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageNewsCell" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor orangeColor];
    
    cell.model = self.data[indexPath.item];
    
    return cell;
    

}

#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    
    BaseNavigationController *baseNaviVC = [[BaseNavigationController alloc]initWithRootViewController:photoVC];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    
    for (int i =0; i<self.data.count; i++) {
        
        ImageModel *model = self.data[i];
        
        NSString *iamgeUrl = model.image;
        
        [imageArray addObject:iamgeUrl];
        
    }

    //需要传递2个信息
    //1 imageArray
    //2 indexPath
    photoVC.imageArray = imageArray;
    photoVC.indexPath = indexPath;
    
   
    
    [self.navigationController presentViewController:baseNaviVC animated:YES completion:NULL];
    
    
    
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
