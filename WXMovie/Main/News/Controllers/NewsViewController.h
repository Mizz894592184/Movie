//
//  NewsViewController.h
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface NewsViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UITableView *newsTableView;
@property(nonatomic,strong)NSMutableArray *data;

@end
