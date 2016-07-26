//
//  ViewController.m
//  NSCopyDemo
//
//  Created by asus on 16/7/26.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "ViewController.h"
#import "FDTestModel.h"


@interface ViewController ()

- (IBAction)customObjectCopy:(id)sender;

- (IBAction)copyNotAllDeepCopy:(id)sender;

- (IBAction)mutableCopyNotAllDeepCopy:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FDLog(@"NSCopy demo");
    
    
}

- (IBAction)customObjectCopy:(id)sender {
    
    FDLog(@"自定义类需要实现NSCoping协议，重写copyWithZone方法才能实现copy");
    FDLog(@"自定义类需要实现NSMutableCoping协议，重写mutableWithZone方法才能实现MutableCopy");
    
    FDTestModel *model = [[FDTestModel alloc] init];
    model.name = @"zhufeidong";
    model.age = 25;
    
    FDTestModel *modelCopy = [model copy];
    FDLog(@"%p, %p name:%@ age:%ld", model, modelCopy, modelCopy.name, modelCopy.age);
}

- (IBAction)copyNotAllDeepCopy:(id)sender {

    FDLog(@"重可变中拷贝出来，都是深拷贝");
    FDLog(@"从不可变中拷贝出来，就是浅拷贝");
    
//    NSArray *array = [NSArray array];
//    NSMutableArray *arrayM = [array copy];  //其实实际上还是不可变类型，如果对他插入数据，就会导致崩溃
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [arrayM copy];
    FDLog(@"深拷贝，地址不一样%p, %p", array, arrayM);
    
}
- (IBAction)mutableCopyNotAllDeepCopy:(id)sender {
    
    FDLog(@"对于集合类型拷贝，内部的元素不会做深拷贝，只是对集合进行了深拷贝");
    NSArray *array = @[@"aa"];
    NSMutableArray *arrayM = [array mutableCopy];
    
    FDLog(@"集合是深拷贝:%p, %p", array, arrayM);
    FDLog(@"集合的内容是浅拷贝：%p, %p", array[0], arrayM[0]);

}
@end
