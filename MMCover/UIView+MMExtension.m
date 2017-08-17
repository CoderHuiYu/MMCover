//
//  UIView+MMExtension.m
//  MMCover
//
//  Created by 余辉 on 2017/8/9.
//  Copyright © 2017年 Yu. All rights reserved.
//

#import "UIView+MMExtension.h"

@implementation UIView (MMExtension)

- (void)setMm_width:(CGFloat)mm_width
{
    CGRect rect = self.frame;
    rect.size.width = mm_width;
    self.frame = rect;
}

- (CGFloat)mm_width
{
    return self.frame.size.width;
}

- (void)setMm_height:(CGFloat)mm_height
{
    CGRect rect = self.frame;
    rect.size.height = mm_height;
    self.frame = rect;
}

- (CGFloat)mm_height
{
    return self.frame.size.height;
}

- (void)setMm_x:(CGFloat)mm_x
{
    CGRect rect = self.frame;
    rect.origin.x = mm_x;
    self.frame = rect;
}

- (CGFloat)mm_x
{
    return self.frame.origin.x;
}

- (void)setMm_y:(CGFloat)mm_y
{
    CGRect rect = self.frame;
    rect.origin.y = mm_y;
    self.frame = rect;
}

- (CGFloat)mm_y
{
    return self.frame.origin.y;
}

- (void)setMm_right:(CGFloat)mm_right
{
    CGRect rect = self.frame;
    rect.origin.x = mm_right - rect.size.width;
    self.frame = rect;
}

- (CGFloat)mm_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMm_bottom:(CGFloat)mm_bottom
{
    CGRect rect = self.frame;
    rect.origin.y = mm_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)mm_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMm_centerX:(CGFloat)mm_centerX
{
    CGPoint center = self.center;
    center.x = mm_centerX;
    self.center = center;
}

- (CGFloat)mm_centerX
{
    return self.center.x;
}

- (void)setMm_centerY:(CGFloat)mm_centerY
{
    CGPoint center = self.center;
    center.y = mm_centerY;
    self.center = center;
}

- (CGFloat)mm_centerY
{
    return self.center.y;
}

-(void)setMm_center:(CGPoint)mm_center{
     CGPoint center = self.center;
    center.x = mm_center.x;
    center.y = mm_center.y;
     self.center = center;
}
-(CGPoint)mm_center{
    return self.center;
}
- (void)setMm_size:(CGSize)mm_size
{
    CGRect rect = self.frame;
    rect.size = mm_size;
    self.frame = rect;
}

- (CGSize)mm_size
{
    return self.frame.size;
}


@end
