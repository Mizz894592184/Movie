//
//  CommnetModel.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "BaseModel.h"

@interface CommnetModel : BaseModel
/*
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"
 },
 */
@property(nonatomic,copy)NSString *userImage; //用户头像
@property(nonatomic,copy)NSString *nickname;//昵称
@property(nonatomic,copy)NSString *rating;//评分
@property(nonatomic,copy)NSString *content;//内容

@end
