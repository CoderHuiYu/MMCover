//
//  MMViewController.m
//  MMCoverDemo
//
//  Created by 余辉 on 2017/8/17.
//  Copyright © 2017年 Yu. All rights reserved.
//

#import "MMViewController.h"
#import "MMCover.h"
@interface MMViewController ()

@end

@implementation MMViewController
#pragma mark - lazy -

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btnTop= [[UIButton alloc]initWithFrame:CGRectMake(30, 280, 100, 30)];
    [btnTop setTitle:@"显示位置上" forState:UIControlStateNormal];
    [btnTop setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnTop setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btnTop addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    btnTop.tag =1;
    UIButton * btnCenter= [[UIButton alloc]initWithFrame:CGRectMake(30, 350, 100, 30)];
    [btnCenter setTitle:@"显示位置中" forState:UIControlStateNormal];
    [btnCenter setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnCenter setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btnCenter addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
     btnCenter.tag =2;
    
    UIButton * btnBottom= [[UIButton alloc]initWithFrame:CGRectMake(30, 420, 100, 30)];
    [btnBottom setTitle:@"显示位置下" forState:UIControlStateNormal];
    [btnBottom setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnBottom setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btnBottom addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
     btnBottom.tag =3;
    [self.view addSubview:btnTop];
    [self.view addSubview:btnCenter];
    [self.view addSubview:btnBottom];
}



#pragma mark - Private -
-(void)show:(UIButton *)sender{
    UIView * orangeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 200)];
    orangeView.backgroundColor = [UIColor orangeColor];

    if (sender.tag == 1) {
        [MMCover mm_coverOnwindow:orangeView locationStyle:MMCoverLocationStyleTop show:^{
            
        } hide:^{
            
        }];
    }else if (sender.tag == 2) {
        [MMCover mm_coverOnwindow:orangeView locationStyle:MMCoverLocationStyleCenter show:^{
            
        } hide:^{
            
        }];
    }else{
        [MMCover mm_coverOnwindow:orangeView locationStyle:MMCoverLocationStyleBottom show:^{
            
        } hide:^{
            
        }];
    }
    

}
#pragma mark - Getter -

#pragma mark - Setter -
@end
