//
//  AppDelegate.h
//  001---直播架构搭建
//
//  Created by cooci on 2018/10/23.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXBADelegate.h"

@interface AppDelegate : MXBADelegate

@property (nonatomic, strong) CALayer *brightnessLayer;
@property (nonatomic, strong) NSData *deviceToken;

@end

