//
//  LDUtil.m
//  002
//
//  Created by consumer iddd on 2020/3/7.
//  Copyright © 2020 consumer iddd. All rights reserved.
//

#import "LDUtil.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@implementation LDUtil

+ (void)printIvars:(id)obj {
    unsigned int numIvars; // 成员变量个数
    Ivar *vars = class_copyIvarList([obj class], &numIvars);
    for(int i =0; i < numIvars; i++) {
        Ivar ivar = vars[i];
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"name:%s, type:%s, offset:%#tx", ivar_getName(ivar), ivar_getTypeEncoding(ivar), offset);
    }
    free(vars);
}

+ (id)getIvar:(id)obj ivarName:(NSString *)name {
    unsigned int numIvars; // 成员变量个数
    Ivar *vars = class_copyIvarList([obj class], &numIvars);
    id resultObj;
    for(int i =0; i < numIvars; i++) {
        if ([[NSString stringWithUTF8String:ivar_getName(vars[i])] isEqualToString:name]) {
            ptrdiff_t offset = ivar_getOffset(vars[i]);
            resultObj = (__bridge id)((void *)(*((long *)((__bridge void *)obj + offset))));
            break;
        }
    }
    free(vars);
    return resultObj;
}

+ (id)copyObj:(id)obj {
    if (!obj) {
        return nil;
    }
    size_t size = malloc_size((__bridge const void *)obj);
    void *objTmp = (void *)malloc(size);
    memcpy(objTmp, (__bridge void *)obj, size);
    return (__bridge id)objTmp; /// 用完记得free
}

+ (id)copyObjV2:(id)obj {
    if (!obj) {
        return nil;
    }
    size_t size = malloc_size((__bridge const void *)obj);
    void *objTmp = (void *)malloc(size);
    for (int i = 0; i < size; i++) {
        // 一个字节一个字节的copy
        *((int8_t *)(objTmp + i)) = *((int8_t *)((__bridge void *)obj + i));
    }
    return (__bridge id)objTmp; /// 用完记得free
}

@end
