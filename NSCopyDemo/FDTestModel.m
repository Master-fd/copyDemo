//
//  FDTestModel.m
//  NSCopyDemo
//
//  Created by asus on 16/7/26.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "FDTestModel.h"

@interface FDTestModel()<NSCopying>



@end
@implementation FDTestModel

/**
 *  需要遵循NSCopiny协议，重写copyWithZone方法
 */
- (id)copyWithZone:(NSZone *)zone
{
    FDLog(@"重写copyWithZone");
    FDTestModel *test = [[FDTestModel alloc] init];
    
    test.name = self.name;
    test.age = self.age;
    
    return test;
}
@end
