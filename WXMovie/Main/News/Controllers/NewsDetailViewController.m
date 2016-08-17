//
//  NewsDetailViewController.m
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "Common.h"
@interface NewsDetailViewController ()
{

    UIWebView *webview;
}
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    //读取url
    NSURL *url = [NSURL URLWithString:@"http://news.mtime.com/2013/08/31/1517208.html"];
    
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //构建网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //加载网络请求
    [webview loadRequest:request];
    
     //自适应屏幕
    webview.scalesPageToFit = YES;
    
    [self.view addSubview:webview];
    
    
    [self loadHtmlData];
    
    
}
-(void)loadHtmlData{
    
    NSDictionary *dic = [DataService loadDataWithListName:@"news_detail"];
    
    NSString *title = [dic objectForKey:@"title"];
    NSString *content = [dic objectForKey:@"content"];
    NSString *time = [dic objectForKey:@"time"];
    NSString *source = [dic objectForKey:@"source"];
    
    //html文件的路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    //根据路径取到文件的内容(字符串格式)
    NSString *htmlStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    // @"qwer%@qwer%@"
    NSString *newsStr = [ NSString stringWithFormat:htmlStr,title,content,time,source];
    
    //将字符串(html内容)加载到web界面上
    [webview loadHTMLString:newsStr baseURL:nil];
    
    

    
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
