//
//  CinemaViewController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "CinemaViewController.h"
#import "Common.h"
#import "CinemaModel.h"
#import "CinemaCell.h"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //close数组的初始化
    for (int i =0; i<30; i++) {
        
        close[i] = YES;
        
    }
    
    
    //1 创建导航按钮
    [self _createNavigationBarItem];
    
    //2 创建表视图
    [self _createTableView];
    
    //3 获取影院的数据
    [self _loadData];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)_loadData{
    
    //1 处理影院数据

    /*我们想要的结构
     {
     "1029":[影院model1,影院model2,影院model3... ],
     "1021":[影院model1,影院model2,影院model3... ],
     "1022":[影院model1,影院model2,影院model3... ],
     "1023":[影院model1,影院model2,影院model3... ],
     ....
     
     1000: [Model]
     }
     */
    //创建了一个空的字典
    _cinemaDictionary = [NSMutableDictionary dictionary];
    
    //处理影院列表的数据
    NSDictionary *jsonData = [DataService loadDataWithListName:@"cinema_list"];
    
    NSArray *cinameList = [jsonData objectForKey:@"cinemaList"];
    
//    --------------------------
    //一个id 对应着有个model
    //根据id在大字典中获取数组,如果数组不存在,就创建数组,将这个数组放在字典中,model数据放在数组中
    //如果数组存在,直接将model放在数组中
    
    for (NSDictionary *cinemaDic in cinameList) {
        
        CinemaModel *model = [[CinemaModel alloc]init];
        
        [model setValueForAttributesWithDictionary:cinemaDic];
        
        
        NSString *districtId =  model.districtId;//区域id
        
    
        //通过区域id,取得对应的影院列表
        NSMutableArray *cinemaArray = [_cinemaDictionary objectForKey:districtId];
        
        if (cinemaArray == nil) {
            
            cinemaArray = [NSMutableArray array];
            
            [_cinemaDictionary setObject:cinemaArray forKey:districtId];
            
        }
        
        [cinemaArray addObject:model];
        
    }
    
    
    //2 处理区域列表数据
    NSDictionary *districtDic =  [DataService loadDataWithListName:@"district_list"];
    
    _districtArray = [districtDic objectForKey:@"districtList"];
    
}
-(void)_createTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];//平铺的样式 (在移动的时候 让头视图保持位置不变)
    
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.delegate = self;
    _tableView.dataSource  =self;
    
    //分割线
    _tableView.separatorColor = [UIColor darkGrayColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    
}

-(void)_createNavigationBarItem{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"movieLocationIcon"] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 20, 20)];
    [button addTarget:self action:@selector(locationAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - Action
-(void)sectionAction:(UIControl*)titleView{

     //1  切换点击的组的状态
    NSInteger section = titleView.tag-1000;
    close[section] = !close[section];
    
    //2 刷新tableview的列表
//    [_tableView reloadData];
    
    //刷新特定组
    NSIndexSet *indexSet =[NSIndexSet indexSetWithIndex:section];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];//自带的动画(渐变)
    
    
}

-(void)locationAction{

    NSLog(@"打印地址");
}


#pragma mark - UITableView DataSource
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _districtArray.count;
    
}
//每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (close[section]) {
        
        return 0;
    }
    
    //获取到区域的第几个字典数据
    NSDictionary *districtDic = [_districtArray objectAtIndex:section];
    //区域ID
    NSString *distirctId = [districtDic objectForKey:@"id"];
    //影院的列表数组
    NSArray *cinemaArray = [_cinemaDictionary objectForKey:distirctId];
    
    return cinemaArray.count;
}

//具体的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaTableViewCell_ID"];
    
    if (cell == nil) {
        
        //手写代码
//        cell = [[CinemaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CinemaTableViewCell_ID"];
        
        //xib创建cell
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CinemaCell" owner:self options:nil]lastObject];
        
    }
   
    //获取到区域的第几个字典数据
    NSDictionary *districtDic = [_districtArray objectAtIndex:indexPath.section];
    //区域ID
    NSString *distirctId = [districtDic objectForKey:@"id"];
    //影院的列表数组
    NSArray *cinemaArray = [_cinemaDictionary objectForKey:distirctId];
    
    CinemaModel *model = cinemaArray[indexPath.row];
    
    
    
    cell.model =model;
    
    return cell;
    
}

#pragma mark - UItableView Delegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 121;
    
}
//组高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
    
}

//头视图
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    //获取数据内容
    NSDictionary *districtDic = [_districtArray objectAtIndex:section];
    NSString *name = [districtDic objectForKey:@"name"];
    
    
    
    UIControl *titleView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleView.tag = section+1000;
    
    
    titleView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"hotMovieBottomImage@2x"]];
    [titleView addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 0, 0)];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.text =name;
    //大小自适应
    [textLabel sizeToFit];
    
    [titleView addSubview:textLabel];
    
    return titleView;
    
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
