//
//  MovieModel.h
//  WXMovie
//
//  Created by bing on 16/7/19.
//  Copyright © 2016年 bing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
/*
 {
 "rating": {
 "max": 10,
 "average": 7.8,
 "stars": "40",
 "min": 0
 },
 "genres": [
 "喜剧",
 "动画"
 ],
 "title": "爱宠大机密",
 "casts": [
 {
 "alt": "https://movie.douban.com/celebrity/1049602/",
 "avatars": {
 "small": "https://img3.doubanio.com/img/celebrity/small/11534.jpg",
 "large": "https://img3.doubanio.com/img/celebrity/large/11534.jpg",
 "medium": "https://img3.doubanio.com/img/celebrity/medium/11534.jpg"
 },
 "name": "路易·C·K",
 "id": "1049602"
 },
 {
 "alt": "https://movie.douban.com/celebrity/1049652/",
 "avatars": {
 "small": "https://img3.doubanio.com/img/celebrity/small/5020.jpg",
 "large": "https://img3.doubanio.com/img/celebrity/large/5020.jpg",
 "medium": "https://img3.doubanio.com/img/celebrity/medium/5020.jpg"
 },
 "name": "艾瑞克·斯通斯崔特",
 "id": "1049652"
 },
 {
 "alt": "https://movie.douban.com/celebrity/1286162/",
 "avatars": {
 "small": "https://img1.doubanio.com/img/celebrity/small/25517.jpg",
 "large": "https://img1.doubanio.com/img/celebrity/large/25517.jpg",
 "medium": "https://img1.doubanio.com/img/celebrity/medium/25517.jpg"
 },
 "name": "凯文·哈特",
 "id": "1286162"
 }
 ],
 "collect_count": 1504,
 "original_title": "The Secret Life of Pets",
 "subtype": "movie",
 "directors": [
 {
 "alt": "https://movie.douban.com/celebrity/1295449/",
 "avatars": {
 "small": "https://img1.doubanio.com/img/celebrity/small/29587.jpg",
 "large": "https://img1.doubanio.com/img/celebrity/large/29587.jpg",
 "medium": "https://img1.doubanio.com/img/celebrity/medium/29587.jpg"
 },
 "name": "克里斯·雷纳德",
 "id": "1295449"
 },
 {
 "alt": "https://movie.douban.com/celebrity/1280591/",
 "avatars": {
 "small": "https://img3.doubanio.com/img/celebrity/small/1467266335.21.jpg",
 "large": "https://img3.doubanio.com/img/celebrity/large/1467266335.21.jpg",
 "medium": "https://img3.doubanio.com/img/celebrity/medium/1467266335.21.jpg"
 },
 "name": "雅候·迟内",
 "id": "1280591"
 }
 ],
 "year": "2016",
 "images": {
 "small": "https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2363872756.jpg",
 "large": "https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2363872756.jpg",
 "medium": "https://img3.doubanio.com/view/movie_poster_cover/spst/public/p2363872756.jpg"
 }
 */

//数据模型
@interface MovieModel : BaseModel

@property(nonatomic,strong)NSDictionary *rating;//评分

@property(nonatomic,assign)NSUInteger collect_count;//收藏数

@property(nonatomic,strong)NSString *title;//标题

@property(nonatomic,strong)NSString *year;//年份

@property(nonatomic,strong)NSDictionary *images;//图片


@end
