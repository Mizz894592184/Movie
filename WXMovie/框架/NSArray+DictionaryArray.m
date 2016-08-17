//
//  NSArray+DictionaryArray.m
//  WXMovie
//
//  Created by mac on 16/8/13.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "NSArray+DictionaryArray.h"

@implementation NSArray (DictionaryArray)
-(NSMutableArray *)dictionaryArray:(NSArray *)array key:(NSString *)key
{
    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0 ; i < array.count; i++) {
        NSDictionary *dic = [array[i] objectForKey:key];
        [array1 addObject:dic];
    }
    return array1;
}
@end
