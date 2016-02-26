//
//  User.h
//  freeHeightForCell
//
//  Created by CHENZICHU on 15/12/25.
//  Copyright © 2015年 CHENZICHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
// 用户id
@property (nonatomic, assign) NSInteger identifier;
// 用户昵称
@property (nonatomic, copy) NSString *nickname;
// 用户头像
@property (nonatomic, copy) NSString *pic_path;
// 用户类型
@property (nonatomic, assign) NSInteger user_type;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
