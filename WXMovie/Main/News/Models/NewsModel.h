//
//  NewsModel.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseModel.h"

@interface NewsModel : BaseModel
/*{
 "newsid" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }*/

@property(nonatomic,copy)NSNumber *NewsModelId;
@property(nonatomic,copy)NSNumber *type;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary; //内容
@property(nonatomic,copy)NSString *image; //图片


@end
