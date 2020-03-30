//
//  LDUtil.h
//  002
//
//  Created by consumer iddd on 2020/3/7.
//  Copyright © 2020 consumer iddd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDUtil : NSObject

/// 打印obj的所有成员变量的信息
/// @param obj 实例对象
+ (void)printIvars:(id)obj;

/// 找到obj名字为name的成员变量
/// @param obj 实例对象
/// @param name 成员变量名
+ (id)getIvar:(id)obj ivarName:(NSString *)name;

/// 拷贝出来的新的对象（相当于深拷贝，用完记得free）
/// @param obj 待拷贝的对象
+ (id)copyObj:(id)obj;

/// 拷贝出来的新的对象（相当于深拷贝，用完记得free）
/// @param obj 待拷贝的对象
+ (id)copyObjV2:(id)obj;

@end

NS_ASSUME_NONNULL_END
