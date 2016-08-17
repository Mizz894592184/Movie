//
//  NewsViewController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "NewsViewController.h"
#import "DataService.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "Common.h"
#import "NewsDetailViewController.h"
#import "ImageDetailViewController.h"
enum NewsType {

    WordType,//文字新闻  0
    ImageType,//图片新闻 1
    VideoType //视频新闻 2
};


@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UIImageView *imageV;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self configTableView];
    
    
    // Do any additional setup after loading the view.
}
-(void)configTableView{

    
    self.newsTableView.rowHeight = 110;
    
    //注册
    [self.newsTableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCell_ID"];
    
    
    //headerView
    
    UIView *fakerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
//    fakerView.backgroundColor = [UIColor orangeColor];
    
    self.newsTableView.tableHeaderView = fakerView;
    
    
    imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 200)];
    
    NewsModel *model = self.data[0];
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:model.image]];
//
    [self.view addSubview:imageV];
    
    
    //删除第一条数据
    [self.data removeObjectAtIndex:0];
    
}



-(void)loadData{
    
    NSArray *newsList = [DataService loadDataWithListName:@"news_list"];
    
    self.data = [NSMutableArray array];
    
    for (int i =0; i<newsList.count; i++) {
        
        NewsModel *model = [[NewsModel alloc]init];
        
        NSDictionary *dic = newsList[i];
        [model setValueForAttributesWithDictionary:dic];
        
        [self.data addObject:model];
        
        
    }

    
}
#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.data.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell_ID" forIndexPath:indexPath];
    
    
    cell.model = self.data[indexPath.row];
    
    
    
    return cell;
    
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NewsModel *model = self.data[indexPath.row];
    
    int typeNumber = [model.type intValue];
    
    if (typeNumber == WordType) { //文字新闻
        
        
        NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc]init];
        
        newsDetailVC.hidesBottomBarWhenPushed = YES;
        
        
        [self.navigationController pushViewController:newsDetailVC animated:YES];
        
        
    }else if (typeNumber == ImageType){ //图片新闻
        
        UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
         ImageDetailViewController *imageDetailVC = [storyB instantiateViewControllerWithIdentifier:@"ImageDetailViewController"];
        
        [self.navigationController pushViewController:imageDetailVC animated:YES];
        
        
    
        
        
    }
    
}


// 实时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //contentOffset:偏移量
    CGFloat offSetY = scrollView.contentOffset.y;
    
    NSLog(@"offSetY:%.2f",offSetY);
    
    if (offSetY>-64) {//上拉
        
        imageV.top = -offSetY;
        
     
        
    }else{//下拉
    
        CGFloat newHeight =  ABS(offSetY+64) +200;
        //        375/200 = newWidth/newHeight
        CGFloat newWidth =KScreenWidth/200*newHeight;
        
        imageV.frame = CGRectMake(-(newWidth-KScreenWidth)/2, 64, newWidth, newHeight);
        
    }
    
    
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
