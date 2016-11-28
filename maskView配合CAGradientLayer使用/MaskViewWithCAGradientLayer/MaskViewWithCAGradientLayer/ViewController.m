//
//  ViewController.m
//  MaskViewWithCAGradientLayer
//
//  Created by 薛尧 on 16/11/21.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UILabel *unlock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self maskViewWithCAGradientLayer];
}

- (void)maskViewWithCAGradientLayer
{
    self.view.backgroundColor = [UIColor grayColor];
    // 1.首先构建一个颜色渐变的layer,可以使用CAGradientLayer这个类,也可以使用一个颜色渐变的图片
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 200, self.view.bounds.size.width, 64);
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor
                             ];
    gradientLayer.locations = @[@0.25, @0.5, @0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    // 2.给这个图层加个动画,让这个图层动起来
    // CAGradientLayer可以用来处理颜色渐变,它的渐变色也可以做隐式动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 3.让UILabel上的文字成为CAGradientLayer的遮罩,完成.
    // 设置gradientLayer的mask为unlock,有透明度的地方就漏出来了
//    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
//    
////    [self.view addSubview:unlock];
//    
//    self.unlock = unlock;
//    unlock.alpha = 0.5;
//    unlock.text = @"滑动来解锁 >>";
//    unlock.textAlignment = NSTextAlignmentCenter;
//    unlock.font = [UIFont boldSystemFontOfSize:30];
//    gradientLayer.mask = unlock.layer;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
