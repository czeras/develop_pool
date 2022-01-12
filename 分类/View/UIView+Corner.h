/*******************************************************
 * 文件描述：切圆角
 * 说　　明：<#文件包含了xxx业务所用到的相关数据模型#>
 * 作　　者：<#姓名#>
 * 组　　织：
 * 创建时间：2021-<#11#>-<#01#>
 * 更新时间：2021-<#11#>-<#01#>
 *******************************************************/
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Corner)

- (void)corners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)corners:(UIRectCorner)corners radius:(CGFloat)radius border:(CGFloat)width color:(nullable UIColor *)color;

@end

NS_ASSUME_NONNULL_END


/** eg：
 self.withAccountView = [[UIView alloc]initWithFrame:CGRectMake(backImgView.left, textView.bottom+10, backImgView.width, 50)];
 self.withAccountView.backgroundColor = [UIColor whiteColor];
 [self.view addSubview:self.withAccountView];
 
 // 使用封装的方法绘制圆角
 [self.withAccountView corners:UIRectCornerTopLeft|UIRectCornerTopRight radius:5.0 border:0 color:[UIColor clearColor]];
 
 */
