//
//  KCDDContext.m
//  KCDDDemo
//
//  Created by gao feng on 16/2/3.
//  Copyright © 2016年 gao feng. All rights reserved.
//

#import "KCDDContext.h"

@implementation KCDDPresenter
@end

@implementation KCDDInteractor
@end

@implementation KCDDView
- (void)dealloc
{
    self.context = nil;
}
@end

@implementation KCDDContext

- (void)dealloc
{
    NSLog(@"context being released");
}

@end
