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
    
    
    KCLiveStreamViewController *liveVC = [[KCLiveStreamViewController alloc] init];
    
//    [self.baseController.navigationController presentViewController:liveVC animated:YES completion:^{
//        KCLog(@"进入直播间");
//    }];

//    [self.baseController.navigationController presentViewController:liveVC animated:YES completion:^{
//        KCLog(@"进入直播间");
//    }];

    [self.baseController.navigationController pushViewController:liveVC animated:YES];
}

@end
