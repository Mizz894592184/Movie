//
//  DataService.m
//  WXMovie
//
//  Created by bing on 16/7/22.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+(id)loadDataWithListName:(NSString*)listName{

    NSString *path = [[NSBundle mainBundle]pathForResource:listName ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    id data= [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return data;
    
}

@end
