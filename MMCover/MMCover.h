//
//  MMCover.h
//  MMCover
//
//  Created by 余辉 on 2017/8/9.
//  Copyright © 2017年 Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCoverEnum.h"
typedef void(^showBlock)();
typedef void(^hideBlock)();

@interface MMCover : UIView

/**
 *  显示在view上
 *
 *  @param superView     显示在该视图上
 *  @param customeView   自定义视图
 *  @param locationStyle 显示位置的选择
 *  @param show          显示后的回调
 *  @param hide          隐藏后的回调
 */
+ (void)mm_cover:(UIView *)superView
     customeView:(UIView *)customeView
   locationStyle:(MMCoverLocationStyle)locationStyle
            show:(void(^)())show
            hide:(void(^)())hide;
/**
 *  显示在window上
 *
 *  @param customeView   自定义视图
 *  @param locationStyle 显示位置的选择
 *  @param show          显示后的回调
 *  @param hide          隐藏后的回调
 */
+ (void)mm_coverOnwindow:(UIView *)customeView
           locationStyle:(MMCoverLocationStyle)locationStyle
                    show:(void(^)())show
                    hide:(void(^)())hide;

@end
