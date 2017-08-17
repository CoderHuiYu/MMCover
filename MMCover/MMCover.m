//
//  MMCover.m
//  MMCover
//
//  Created by 余辉 on 2017/8/9.
//  Copyright © 2017年 Yu. All rights reserved.
//

#import "MMCover.h"
#import "UIView+MMExtension.h"
#import "MMCoverEnum.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define AnimDuration 0.25 /** 默认动画时间 */
#pragma mark - 因为是类方法，无法使用成员变量 -
static MMCover                     *_cover;           // 遮罩
static UIView                      *_superView;       // 显示在此视图上
static UIView                      *_customeView;     // 显示的视图
static hideBlock                   _hideBlock;        //隐藏后调用的block
static showBlock                   _showBlock;        //显示后调用的block
static MMCoverLocationStyle        _locationStyle;    // 显示位置类型
@interface MMCover ()

@end

@implementation MMCover

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 自动伸缩
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.2];
        
//        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
+(instancetype)mm_cover{
    
    return [[self alloc]init];
}
#pragma mark - 一些类方法 -
+ (UIWindow *)getKeyWindow
{
    return [UIApplication sharedApplication].keyWindow;
}
#pragma mark - 显示在view上
+ (void)mm_cover:(UIView *)superView
     customeView:(UIView *)customeView
            show:(void(^)())show
            hide:(void(^)())hide
{
    _cover = [self mm_cover];
    _superView = superView;
    _customeView = customeView;
    _hideBlock = hide;
    _cover.frame = superView.bounds; //默认cover的frame和superView（即显示在它上面）的frame一样大
    _customeView.mm_x = (superView.mm_width -customeView.mm_width)/2;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide:)];
    [_cover addGestureRecognizer:tap];
    
    [superView addSubview:_cover];
    [self showWith:show];
    
}
#pragma mark - 显示在window上 -
+ (void)mm_coverOnwindow:(UIView *)customeView
                    show:(void(^)())show
                    hide:(void(^)())hide
{
    UIWindow * window = [self getKeyWindow];
    [self mm_cover:window customeView:customeView show:show hide:hide];
}

#pragma mark - 有选择位置的 MMCoverLocationStyle-
+ (void)mm_cover:(UIView *)superView
     customeView:(UIView *)customeView
   locationStyle:(MMCoverLocationStyle)locationStyle
            show:(void(^)())show
            hide:(void(^)())hide
{
    _locationStyle = locationStyle;
    [MMCover mm_cover:superView customeView:customeView show:show hide:hide];
}
+ (void)mm_coverOnwindow:(UIView *)customeView
           locationStyle:(MMCoverLocationStyle)locationStyle
                    show:(void(^)())show
                    hide:(void(^)())hide{
    _locationStyle = locationStyle;
    [MMCover mm_coverOnwindow:customeView show:show hide:hide];
}

#pragma mark - 隐藏
+ (void)hide:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:_cover];
    
    if (CGRectContainsPoint(_customeView.frame, point)) {
        
    }else{
        
        switch (_locationStyle) {
            case MMCoverLocationStyleTop:
            {
                [UIView animateWithDuration:AnimDuration animations:^{
                    _customeView.mm_y = -_customeView.mm_height;
                } completion:^(BOOL finished) {
                    [_customeView removeFromSuperview];
                    [_cover removeFromSuperview];
                    if (_hideBlock) {
                        _hideBlock();
                    }
                }];
            }
                break;
            case MMCoverLocationStyleCenter:{
                
                [UIView animateWithDuration:AnimDuration animations:^{
                    _customeView.mm_y = SCREENH;
                } completion:^(BOOL finished) {
                    [_customeView removeFromSuperview];
                    [_cover removeFromSuperview];
                    if (_hideBlock) {
                        _hideBlock();
                    }
                }];
            }
                break;
            case MMCoverLocationStyleBottom:{
                
                [UIView animateWithDuration:AnimDuration animations:^{
                    _customeView.mm_y = SCREENH;
                } completion:^(BOOL finished) {
                    [_customeView removeFromSuperview];
                    [_cover removeFromSuperview];
                    if (_hideBlock) {
                        _hideBlock();
                    }
                }];
            }
                break;
            default:
                break;
        }
    }
    
}
#pragma mark - 显示
+ (void)showWith:(void (^)())show
{
    switch (_locationStyle) {
        case MMCoverLocationStyleTop:
        {
            NSLog(@"%f",_customeView.mm_y);
            _customeView.mm_y = -_customeView.mm_height;
            
            [UIView animateWithDuration:AnimDuration animations:^{
                _customeView.mm_y = 0;
                _customeView.mm_centerX = _superView.mm_centerX;
                
                [_cover addSubview:_customeView];
            } completion:^(BOOL finished) {
                if (show) {
                    show();
                }
            }];
        }
            break;
        case MMCoverLocationStyleCenter:{
            _customeView.mm_y = 0;
            [UIView animateWithDuration:AnimDuration animations:^{
                _customeView.mm_center = _superView.mm_center;
                [_cover addSubview:_customeView];
            } completion:^(BOOL finished) {
                if (show) {
                    show();
                }
            }];
        }
            break;
        case MMCoverLocationStyleBottom:{
            _customeView.mm_y = SCREENH;
            [UIView animateWithDuration:AnimDuration animations:^{
                _customeView.mm_y = SCREENH - _customeView.mm_height;
                _customeView.mm_centerX = _superView.mm_centerX;
                [_cover addSubview:_customeView];
            } completion:^(BOOL finished) {
                if (show) {
                    show();
                }
            }];
        }
            break;
        default:
            break;
    }
    
}

@end
