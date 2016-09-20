
//
//  TestModel.m
//  UITableView计算高度
//
//  Created by 荣耀iMac on 16/9/19.
//  Copyright © 2016年 wleleven. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        //        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

@end
