//
//  CinemaViewController.h
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface CinemaViewController : BaseViewController

{
    //C语言的数组
    BOOL close[30];// yes:收起 no:展开(默认)
    
    UITableView *_tableView;
    
    /*结构
     {
     "1029":[影院model1,影院model2,影院model3... ],
     "1021":[影院model1,影院model2,影院model3... ],
     "1022":[影院model1,影院model2,影院model3... ],
     "1023":[影院model1,影院model2,影院model3... ],
     ....
     
     }
     
     */
    
    NSMutableDictionary *_cinemaDictionary;//影院字典
    
    
    
    
    /*结构
     [
         {
         "name" : "东城区",
         "id" : "1029"
         }
         {
         "name" : "东城区",
         "id" : "1029"
         }
         ...
     ]
     */
    
    NSArray *_districtArray;//区域数组
}

@end
