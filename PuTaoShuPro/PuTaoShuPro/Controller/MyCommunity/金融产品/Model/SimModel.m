//
//  SimModel.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/3.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "SimModel.h"

@implementation SimModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    self=[super init];
    if (self) {
        self.title=dict[@"title"];
        self.SimtypeId=dict[@"typeid"];
        self.SimId=dict[@"id"];
        self.SimTime=dict[@"time"];
    }
    return self;
}
+(instancetype)SimWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
+(NSArray*)SimWithArray:(NSArray *)array{
    NSMutableArray*arrayM=[NSMutableArray array];
    for (NSDictionary*dict in array) {
        [arrayM addObject:[self SimWithDict:dict]];
    }
    return arrayM;
}
@end
