//
//  KCLiveStreamInputView.h
//  001---直播架构搭建
//
//  Created by gao feng on 16/7/27.
//  Copyright © 2016年 music4kid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCLiveStreamInputView : UIView

- (void)initCustomView;

- (void)resignTextInputView;
- (void)activateTextInputView;

- (void)buildInputView;

- (BOOL)isInputViewTriggeringKeyboard;
- (BOOL)isDynamicResign;


@end
