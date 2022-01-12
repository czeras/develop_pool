//
//  AppDelegate.h
//  MVPCase
//
//  Created by YongQin on 2021/12/15.
//

#import <UIKit/UIKit.h>
#import "MXBADelegate.h"

@interface AppDelegate : MXBADelegate

@property (nonatomic, strong) CALayer *brightnessLayer;
@property (nonatomic, strong) NSData *deviceToken;

@end

