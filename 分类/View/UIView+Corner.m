//
//  UIView+Corner.m
//  yunbaolive
//
//  Created by YongQin on 2022/1/6.
//  Copyright © 2022 cat. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)

- (void)corners:(UIRectCorner)corners radius:(CGFloat)radius {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:(CGSize){radius}];
    CAShapeLayer *shapeLayer = self.layer.mask ?: [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

- (void)corners:(UIRectCorner)corners radius:(CGFloat)radius border:(CGFloat)width color:(UIColor *)color {
    
    [self corners:corners radius:radius];
    
    CAShapeLayer *subLayer = [CAShapeLayer layer];
    subLayer.lineWidth = width * 2;
    subLayer.strokeColor = color.CGColor;
    subLayer.fillColor = [UIColor clearColor].CGColor;
    subLayer.path = ((CAShapeLayer *)self.layer.mask).path;
    [self.layer addSublayer:subLayer];
}

@end
