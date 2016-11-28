//
//  ViewController.m
//  MaskViewAnimations1
//
//  Created by 薛尧 on 16/11/18.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     CALayer有一个属性叫做mask（对应UIView中maskView属性，下文说的maskView和mask是一个东西），mask图层定义了父图层的部分可见区域，功能类似于PS 中的图层蒙版。
     mask图层的Color属性是无关紧要的，真正重要的是图层的轮廓。mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。
     
     也可以这样理解，maskView将每个point的alpha赋值给View的重叠部分相对应的point，这样view的重叠每个point都有个alpha值了，view重叠部分就可能显示多种透明色。
     */
    
    // 在底层的图片background(最后要显示出来)
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    background.image = [UIImage imageNamed:@"base"];
    background.center = self.view.center;
    [self.view addSubview:background];
    
    // 在上层的图片upGround
    UIImageView *upGround = [[UIImageView alloc] initWithFrame:background.frame];
    upGround.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:upGround];
    
    // maskView由两个分别加载"mask1" "mask"的imageView拼接而成,加在上层图片上,注意,两张透明度渐变的图片是重点.是它们使上层upGround显示或者隐藏
    UIView *mask = [[UIView alloc] initWithFrame:upGround.bounds];
    upGround.maskView = mask;
    
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
    picOne.image = [UIImage imageNamed:@"mask1"];
    [mask addSubview:picOne];
    
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
    picTwo.image = [UIImage imageNamed:@"mask"];
    [mask addSubview:picTwo];
    
    // 两个imageView的动画 使maskView的alpha通道由 1 变成 0 ，导致 上层图片消失， 达到切换的效果
    [UIView animateWithDuration:4 delay:0 options:0 animations:^{
        picOne.y -= 400;
        picTwo.y += 400;
    } completion:^(BOOL finished) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
