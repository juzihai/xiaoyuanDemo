//
//  SimModel.h
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/3.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimModel : NSObject
@property (nonatomic, copy) NSString *SimtypeId;
@property (nonatomic, copy) NSString *SimId;
@property (nonatomic, copy) NSString *Cover;
@property (nonatomic, copy) NSString *TypeName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pathurl;
@property (nonatomic, copy) NSString *SimTime;

-(instancetype) initWithDict:(NSDictionary*)dict;
+(instancetype) SimWithDict:(NSDictionary*)dict;

+(NSArray*) SimWithArray:(NSArray*)array;

@end
