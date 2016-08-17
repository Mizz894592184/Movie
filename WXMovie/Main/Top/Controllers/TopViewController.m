//
//  TopViewController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "TopViewController.h"
#import "TopModel.h"
#import "DataService.h"
#import "StarView.h"
#import "Common.h"
#import "TopDetailViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>

@interface TopViewController ()
{

    TopDetailViewController *topDetailVC;
    
}
@end

@implementation TopViewController
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    topDetailVC.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout.minimumLineSpacing = 30;
    self.flowLayout.minimumInteritemSpacing = 10;
    
    self.flowLayout.itemSize = CGSizeMake((KScreenWidth-60)/3, 150);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
//    self.topCollectionView.dataSource = self;
    
    //注册  (如果使用storyboard,不必注册)
//    [self.topCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TopCollectionViewCell"];
    
    self.data = [NSMutableArray array];
    [self loadData];
    
  
}

-(void)loadData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.douban.com/v2/movie/top250" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.data = [TopModel mj_objectArrayWithKeyValuesArray:responseObject[@"subjects"]];
        [self.topCollectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
//    NSLog(@"data = %@",self.data);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.data.count;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //作业
    /*CollectionViewCell的创建方法:
     1 使用UICollectionViewCell
       注册  重用  在代理方法中创建子视图添加
     2 自定义CollectionViewCell(纯代码  xib)
       注册(TopCell Class)  重用  
       注册(Nib ) 重用   setModel
     3 使用StoryBoard
      重用(Identifier)
     */
    
    //如果使用storyboard创建collectionCell,cell不用注册
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopCollectionViewCell" forIndexPath:indexPath];
    
    
    //获取对象
    UIImageView *imageV = [cell viewWithTag:1000];
    
    UILabel *titleLabel =[cell viewWithTag:1001];
    
    UILabel *ratingLabel = [cell viewWithTag:1003];
    
    StarView *starView = [cell viewWithTag:1002];
    
    
    //赋值
    TopModel *model =  self.data[indexPath.item];
    
    //
    NSString *imageName = [model.images objectForKey:@"medium"];
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:imageName]];
    
    //
    titleLabel.text = model.title;
    
    //
    NSNumber *average =  [model.rating objectForKey:@"average"];
    ratingLabel.text = [NSString stringWithFormat:@"%.1f",[average floatValue]];
    
    //
    starView.rating = [average floatValue];
    
    
    
    
    
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    //获取到storyboard对象
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    //通过storyboard实例化一个viewController
    //注意:storyboard中 ID的填写(storyboard ID)
    topDetailVC = [storyB instantiateViewControllerWithIdentifier:@"topDetailViewController"];
    
    topDetailVC.hidesBottomBarWhenPushed = YES;
    
       
    
    [self.navigationController pushViewController:topDetailVC animated:YES];
    
    

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
