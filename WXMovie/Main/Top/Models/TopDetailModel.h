//
//  TopDetailModel.h
//  WXMovie
//
//  Created by bing on 16/7/23.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface TopDetailModel : BaseModel

/*
 {
	"image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
	"titleCn" : "摩尔庄园2海妖宝藏",
	"titleEn" : "Legend of The Moles-Treasure of Scylla",
	"rating" : "7.7",
	"year" : "2012",
	"content" : "摩尔庄园大电影系列第二部：《摩尔庄园海妖宝藏》继续讲述快乐、勇敢、热爱和平的小摩尔们战胜邪恶",
	"type" : [ "动画", "动作", "奇幻", "冒险" ],
	"url" : "http://movie.mtime.com/157836/",
	"directors" : [ "刘可欣" ],
	"actors" : ["阿黄","阿龟","阿宇","阿红","凤姐"],
	"release" : {
 "location" : "中国",
 "date" : "2012-7-5"
	},
	"imageCount" : 16,
	"images" : [ "http://img31.mtime.cn/pi/2012/06/14/193026.85486289.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193028.65049217.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193029.38103098.jpg",
 "http://img31.mtime.cn/pi/2012/06/14/193030.29253345.jpg" ],
	"videoCount" : 3,
	"videos" : [
 {
 "url" : "http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4",
 "image" : "http://img21.mtime.cn/mg/2012/04/23/212649.32521220.jpg"
 },
 {
 "url" : "http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4",
 "image" : "http://img31.mtime.cn/mg/2012/06/21/104707.90912302.jpg"
 },
 {
 "url" : "http://vf1.mtime.cn/Video/2012/06/21/mp4/120621112404690593.mp4",
 "image" : "http://img31.mtime.cn/mg/2012/06/21/112031.62936983.jpg"
 },
 {
 "url" : "http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4",
 "image" : "http://img31.mtime.cn/mg/2012/06/21/104707.90912302.jpg"
 }
 ],
	"personCount" : 9
 }
 */
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *titleCn;
@property(nonatomic,strong)NSArray *directors;
@property(nonatomic,strong)NSArray *actors;
@property(nonatomic,strong)NSArray *type;
@property(nonatomic,strong)NSDictionary *TopDetailModelRelease;

@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)NSArray *videos;

//.....


@end
