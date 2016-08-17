//
//  HomeViewController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "HomeViewController.h"
#import "Common.h"
#import "MovieModel.h"
#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "PosterView.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "NSArray+DictionaryArray.h"

@interface HomeViewController ()<UITableViewDataSource>
{
    PosterView *postView;//海报视图
    UITableView *listView;//列表视图
    

}

@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //原因:iOS9更新后一旦设置flowlayout就出现:
//    the behavior of the UICollectionViewFlowLayout is not defined because:the item height must be l
    //解决办法:
       self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    单独设置
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    self.data = [NSMutableArray array];

    //加载数据 (要写在创建视图前面)
    [self loadData];
    
   //1 创建导航控制器右侧按钮
    [self _createNavigationRightItem];

//    //2 创建海报视图
//    [self _createPostView];
    
    //3 创建列表视图
    [self _createListView];
    
}
#pragma mark - 数据加载
-(void)loadData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    
    [manager GET:@"https://api.douban.com/v2/movie/us_box" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *array = [NSArray array];
        NSMutableArray *array1 = [array dictionaryArray:responseObject[@"subjects"] key:@"subject"];
        self.data = [MovieModel mj_objectArrayWithKeyValuesArray:array1];
        [listView reloadData];
        [self _createPostView];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
    
    
    

    
}

#pragma mark - 加载UI
-(void)_createPostView{
    
    postView  = [[PosterView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64-49)];
//    postView.backgroundColor = [UIColor orangeColor];
    postView.data = self.data;
    postView.hidden = NO;
    
    [self.view addSubview:postView];
    
    
    
    
    
    /*
    //布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight-64-49);
    flowLayout.minimumLineSpacing = 30;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGRect frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight-64-49);
    //创建集合视图
    postView = [[UICollectionView alloc]initWithFrame: frame collectionViewLayout:flowLayout];
    postView.backgroundColor = [UIColor orangeColor];
    postView.hidden = NO;
    postView.pagingEnabled = YES;//分页效果
    
    postView.dataSource = self;
    postView.delegate = self;
    
    //注册
    [postView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionView_Cell"];
    
    [self.view addSubview:postView];
    
    
    */
    
    

}
-(void)_createListView{
    
    listView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64-49) style:UITableViewStylePlain];
    listView.backgroundColor = [UIColor clearColor];
    listView.hidden = YES;
    listView.dataSource = self;
    listView.rowHeight = 100;
    
    [self.view addSubview:listView];
    
    
    

}

-(void)_createNavigationRightItem{
    
    //父视图
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    rightView.tag = 1000;
    self.navigationItem.rightBarButtonItem =rightButtonItem;
    
    
    //2个子button
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(1, 2, 48, 26);
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.hidden = YES;
    button1.tag= 1001;
    [rightView addSubview:button1];
    

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(1, 2, 48, 26);
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.hidden = NO;
    button2.tag = 1002;
    [rightView addSubview:button2];
 
}

#pragma mark - button 事件
-(void)rightButtonAction:(UIButton*)btn{
    
    UIButton *btn1 = [self.navigationController.navigationBar viewWithTag:1001];
    UIButton *btn2 = [self.navigationController.navigationBar viewWithTag:1002];
    UIView *view = [self.navigationController.navigationBar viewWithTag:1000];
    
    
    UIViewAnimationOptions option;
    BOOL flip = btn1.hidden;
    if (flip) {
        option =UIViewAnimationOptionTransitionFlipFromLeft;
    }else{
        option =UIViewAnimationOptionTransitionFlipFromRight;
    }
    
    /*
     view:变换的视图
     duration:持续时间
     options:动画类型
     animations:block块  具体的动画
     completion:完成后
     
     */
    [UIView transitionWithView:view duration:0.35 options:option animations:^{
        btn1.hidden =!btn1.hidden;
        btn2.hidden =!btn2.hidden;
        
        
        
    } completion:NULL];
    
    
    [UIView transitionWithView:self.view duration:0.35 options:option animations:^{
        listView.hidden =!listView.hidden;
        postView.hidden =!postView.hidden;
        
        
    } completion:NULL];
    

}

#pragma mark - TableView DataSource
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.data.count;
}

//具体单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer = @"Movie_cell";
    //从重用池中取cell
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell ==nil) {
        
        //没有xib
//        cell = [[MovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        //有xib
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil]lastObject];
     
    }
    
    MovieModel *model =self.data[indexPath.row];
    
    
    //
    cell.model =model;
    
  
    return cell;
    
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
