//
//  MoreViewController.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
//    [self _removeCacheData];
    // Do any additional setup after loading the view.
}
//视图将要出现的时候
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    //获取缓存
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
    
    //MB--kb --b
    titleLabel.text = [NSString stringWithFormat:@"%.2fMB",size/1024.0/1024.0];
    
}
-(void)_removeCacheData{
    
    //一 资源包<该模拟器的该app的资源包(bundle)中>
    //直接使用的
//    NSString *path =  [[NSBundle mainBundle]pathForResource:@"line" ofType:@"png"];
    

    
    
    
    //二 沙盒<该模拟器的该app data路径中>
    //可以进行操作
    /*
     默认的三个文件夹
     1 documents:保存在应用程序中的重要数据文件和用户数据文件(如:下载的文件等)
     2 Library:缓存文件 (在应用程序使用中,保存一些缓存文件或者偏好设置文件)
     3 tmp:临时文件 (app关闭后,该文件夹下的东西会清除)
     */
    
    
    //1 获取沙盒路径
    NSString *home =  NSHomeDirectory();
    
    //(1)图片的缓存路径
    NSString *cachePath = @"Library/Caches/default/com.hackemist.SDWebImageCache.default";
    //(2) 完整的路径
//    NSString *fullPath = [home stringByAppendingString:cachePath];
    //会在2个字符串中间自动加一个/
    NSString *fullPath = [home stringByAppendingPathComponent:cachePath];
    
    //2 使用 文件管理 删除该路径下的缓存文件
    //(1)文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //(2)删除路径下的文件
    [fileManager removeItemAtPath:fullPath error:nil];
   
    
}

//tableView被点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        NSLog(@"清除缓存");
        
        //-------1 UIActionSheet UIAlertView---------------
        
        
        //-------2 UIAlertController---------------
        
        //(1) 创建UIAlertController
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否清除缓存" message:nil preferredStyle:UIAlertControllerStyleAlert];//UIAlertControllerStyleActionSheet
        
        //(2) 创建alertAction
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
            //点击后要完成的事情
            NSLog(@"取消");
        }];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //点击后要完成的事情
            //NSLog(@"确定");
            
            //1 清除缓存
            //(1)使用框架
//            [[SDImageCache sharedImageCache] clearDisk];
            
            //(2)手动删除
            [self _removeCacheData];
            

            //2 刷新tableview
            [self.tableView reloadData];
  
            
        }];
        
        //(3) 添加action
        [alertController addAction:action1];
        [alertController addAction:action2];
        //(4) 使用模态视图弹出alertController
        [self presentViewController:alertController animated:YES completion:NULL];
        
        
//
        
    }
}
//将要显示单元格
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        
        //获取缓存
        NSUInteger size = [[SDImageCache sharedImageCache] getSize];
        
        //MB--kb --b
        titleLabel.text = [NSString stringWithFormat:@"%.2fMB",size/1024.0/1024.0];

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
