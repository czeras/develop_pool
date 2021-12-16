//
//  KCHomeInteractor.m
//  001---直播架构搭建
//
//  Created by cooci on 2018/10/23.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "KCHomeInteractor.h"

@implementation KCHomeInteractor

- (void)gotoLiveStream{
    
    [self.baseController presentViewController:[[KCLiveStreamViewController alloc] init] animated:YES completion:^{
       
        KCLog(@"进入直播间");
    }];
    
    
}

@end
