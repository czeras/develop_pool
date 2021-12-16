//
//  KCDDContext.h
//  KCDDDemo
//
//  Created by gao feng on 16/2/3.
//  Copyright © 2016年 gao feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KCDD.h"

@class KCDDContext;
@class KCDDView;

@interface KCDDPresenter : NSObject
@property (nonatomic, weak) UIViewController*           baseController;
@property (nonatomic, weak) KCDDView*                    view;
@property (nonatomic, weak) id                          adapter; //for tableview adapter

@end

@interface KCDDInteractor : NSObject
//@property (nonatomic, weak) UIViewController*           baseController;
@property (nonatomic, weak) UINavigationController*       baseController;
@end


@interface KCDDView : UIView
@property (nonatomic, weak) KCDDPresenter*               presenter;
@property (nonatomic, weak) KCDDInteractor*              interactor;
@end



//Context bridges everything automatically, no need to pass it around manually
@interface KCDDContext : NSObject

@property (nonatomic, strong) KCDDPresenter*           presenter;
@property (nonatomic, strong) KCDDInteractor*          interactor;
@property (nonatomic, strong) KCDDView*                view; //view holds strong reference back to context

@end
