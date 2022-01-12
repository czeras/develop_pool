//
//  ZYTabBarController.m
//  tabbar增加弹出bar
//
//  Created by tarena on 16/7/2.
//  Copyright © 2016年 张永强. All rights reserved.
//
#import "ZYTabBarController.h"
#import "ZYTabBar.h"
#import "KCHomeViewController.h"


@interface ZYTabBarController ()<ZYTabBarDelegate>

@property(nonatomic,strong)NSString *build;
@property (nonatomic,strong) NSArray *imgParr;


@property (nonatomic,assign) NSInteger  indexFlag;　　//记录上一次点击tabbar，使用时，记得先在init或viewDidLoad里 初始化 = 0

@end
@implementation ZYTabBarController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(intoLiveRoomNoti:) name:@"jinruzhibojiantongzhi" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemNotification:) name:@"system_notification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpdateBadgeNum) name:@"clearTabbarBadgeNum" object:nil];
    [self buildUpdate];
    //设置子视图
    [self setUpAllChildVc];
    [self configureMXtabbar];

}
- (void)configureMXtabbar {
    ZYTabBar *zytabbar = [ZYTabBar new];
    zytabbar.delegate = self;
    zytabbar.backgroundColor = [UIColor whiteColor];
     if (@available(iOS 10.0, *)) {
         [zytabbar setTintColor:[UIColor blackColor]];
         zytabbar.unselectedItemTintColor = [UIColor blackColor];
     }else{
         NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
         textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
         textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
         
         // 选中时字体颜色和选中图片颜色一致
         NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
         selectedTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
         selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
         
         // 通过appearance统一设置所有UITabBarItem的文字属性样式
         UITabBarItem *item = [UITabBarItem appearance];
         [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
         [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    }
    [self setValue:zytabbar forKeyPath:@"tabBar"];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
#pragma mark  在这里更换 左右tabbar的image
- (void)setUpAllChildVc {    
    
    KCHomeViewController *homePage = [[KCHomeViewController alloc] init];
    
    [self setUpOneChildVcWithVc:homePage Image:@"tab_home" selectedImage:@"tab_home_sel" title:@"首页"];
    
//    [self setUpOneChildVcWithVc:homePage Image:@"tab_home" selectedImage:@"tab_home_sel" title:YZMsg(@"首页")];
////    [self setUpOneChildVcWithVc:dynamicPage Image:@"tab_dongtai" selectedImage:@"tab_dongtai_sel" title:YZMsg(@"动态")];
//    [self setUpOneChildVcWithVc:messageListPage Image:@"tab_dongtai" selectedImage:@"tab_dongtai_sel" title:YZMsg(@"消息")];
//    [self UpdateBadgeNum];
//    [self setUpOneChildVcWithVc:rVC Image:@"tab_rank" selectedImage:@"tab_rank_sel" title:YZMsg(@"排行")];
//    [self setUpOneChildVcWithVc:userInfo Image:@"tab_mine" selectedImage:@"tab_mine_sel" title:YZMsg(YZMsg(@"我的"))];
}
#pragma mark - 初始化设置tabBar上面单个按钮的方法
/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Vc];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    Vc.tabBarItem.title = title;
    [Vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -7)];
    [Vc.tabBarItem setImageInsets:UIEdgeInsetsMake(-5, 0, 5, 0)];
    [Vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont systemFontOfSize:11], NSFontAttributeName,RGB(41, 41, 41),NSForegroundColorAttributeName, nil]
                        forState:UIControlStateNormal];
    [Vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont systemFontOfSize:11], NSFontAttributeName,normalColors,NSForegroundColorAttributeName, nil]
                        forState:UIControlStateSelected];
        
    [self addChildViewController:nav];
}





//点击开始直播
- (void)pathButton:(MXtabbar *)MXtabbar clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    
    
}

-(void)buildUpdate{
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
        if (buttonIndex == 0) {
            return;
        }
        else{
        }
}

/// 进入直播间通知
/// @param noti 通知内容
- (void)intoLiveRoomNoti:(NSNotification *)noti{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self setSelectedIndex:0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [homePage moveToControllerAtIndex:0 animated:YES];
    });
    
//    playDic = [noti object];
//    [self checklive:minstr([playDic valueForKey:@"stream"]) andliveuid:minstr([playDic valueForKey:@"uid"])];
}

/// 系统通知消息
/// @param noti <#noti description#>
- (void)systemNotification:(NSNotification *)noti{
    for (UIViewController *tempVc in self.navigationController.viewControllers) {
//        if ([tempVc isKindOfClass:[MessageListVC class]]) {
//            return;
//        }
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        MessageListVC *vc = [[MessageListVC alloc]init];
//        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
//        [self presentViewController:navi animated:YES completion:nil];
    });

}

#pragma mark ================ 检查房间类型 ===============
-(void)checklive:(NSString *)stream andliveuid:(NSString *)liveuid{
    
    
    
}

-(void)doCoastRoomCharge{
    
}
-(void)pushMovieVC{
    
    
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
    

        self.indexFlag = index;
    }
}
- (void)downloadAllLevelImage:(NSArray *)arr{
    for (NSDictionary *dic in arr) {
        
        
    }
}
#pragma mark ================ 视频直播选择视图代理 ===============
-(void)clickLive:(BOOL)islive{
    
}
-(void)hideSelctView{

}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

-(NSArray *)imgParr
{
    if (!_imgParr) {
        _imgParr =@[@"shouye",@"dongtai",@"paihang",@"wode"];
    }
    return _imgParr;
}
@end
