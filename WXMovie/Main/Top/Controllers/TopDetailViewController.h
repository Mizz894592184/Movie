//
//  TopDetailViewController.h
//  WXMovie
//
//  Created by bing on 16/7/22.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface TopDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *topDetailTableView;
@property(nonatomic,strong)NSMutableArray *data;

@end
