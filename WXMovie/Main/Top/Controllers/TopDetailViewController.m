//
//  TopDetailViewController.m
//  WXMovie
//
//  Created by bing on 16/7/22.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "TopDetailViewController.h"
#import "DataService.h"
#import "CommnetModel.h"
#import "CommentCell.h"
#import "TopDetailHeaderView.h"
#import "TopDetailModel.h"
#import "Common.h"
@interface TopDetailViewController ()
{

    TopDetailModel *topModel;
    NSIndexPath *selectIndexpath;//选中的indexPath
    
}
@end

@implementation TopDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCommnetData];
    
    [self loadHeaderData];
    
    
    [self configTableView];
  
}
-(void)configTableView{
    
    self.topDetailTableView.rowHeight = 100;

    //注册
    [self.topDetailTableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"Comment_cell"];
    
    
    //headerView
    
    TopDetailHeaderView *headerView =  [[[NSBundle mainBundle]loadNibNamed:@"TopDetailHeaderView" owner:self options:nil]lastObject];

    headerView.width = KScreenWidth;
    
    headerView.model =topModel;
    
    self.topDetailTableView.tableHeaderView = headerView;
    
    
    
    
    
    
}
-(void)loadHeaderData{

    NSDictionary *headerDic = [DataService loadDataWithListName:@"movie_detail"];
    
    topModel = [[TopDetailModel alloc]init];
    
    [topModel setValueForAttributesWithDictionary:headerDic];
    
    
    
    
}

-(void)loadCommnetData{
    
    //1
    NSDictionary *commentDic =  [DataService loadDataWithListName:@"movie_comment"];
    
    NSArray *listArr = [commentDic objectForKey:@"list"];
    
    self.data = [NSMutableArray array];
    
    for (NSDictionary *dic in listArr) {
        CommnetModel *model = [[CommnetModel alloc]init];
        
        [model setValueForAttributesWithDictionary:dic];
        
        [self.data addObject:model];
        
    }
    

    
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.data.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Comment_cell" forIndexPath:indexPath];
    
    cell.model = self.data[indexPath.row];
    
    return cell;
    
    
}

#pragma mark - UITableView Deleagete
//选中单元格
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //选中的indexPath的赋值
    selectIndexpath = indexPath;
    
    //刷新
    [tableView reloadData];
    
    
}
//返回每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row ==selectIndexpath.row) {
        //返回根据文字大小调节的高度
        
        //(1)获取文字内容
        CommnetModel *model = self.data[indexPath.row];
        NSString *content = model.content;
        
        //(2)属性字典 (字号大小)
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        
        //(3)根据内容和字号判断尺寸
        /*
         rectWithSize:
             width:label的实际宽度
             height:label的最大高度(如果超出这个高度,剩余文字会以省略号的形式出现)
         options:NSStringDrawingUsesLineFragmentOrigin 忽略该选项
         attributes:属性字典
         */
        //根据约束计算:112
//        8+72+8+( labelWidth+8+8)+8 = tableViewWidh
        CGRect rect =  [content boundingRectWithSize:CGSizeMake(tableView.frame.size.width-112, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        
        //根据约束计算:64
        //8+(8+10+21+8+labelHeight)+9 =cellHeight
        //10:微调
        CGFloat cellHeight = rect.size.height+64+10;
       
        if (cellHeight<110) {
            
            cellHeight = 110;
            
        }

        return cellHeight;
        
    }
    
    
    return 110;
    
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
