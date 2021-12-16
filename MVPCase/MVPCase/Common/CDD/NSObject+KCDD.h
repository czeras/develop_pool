//
//  NSObject+KCDD.h
//  KCDDDemo
//
//  Created by gao feng on 16/2/4.
//  Copyright © 2016年 gao feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCDDContext;

@interface NSObject (KCDD)

@property (nonatomic, strong) KCDDContext* context;

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel;

@end
