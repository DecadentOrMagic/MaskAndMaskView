//
//  ViewController.m
//  MaskAndMaskView
//
//  Created by 薛尧 on 16/11/21.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *layerView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self maskOfLayer];
    [self maskViewOfView];
}

#pragma mark - Layer层的mask属性
- (void)maskOfLayer
{
    /**
     CALayer 有一个属性叫做mask 可以解决这个问题。
     mask 属性本身就是个CALayer类型，有和其他图层一样的绘制和布局属性。
     mask图层定义了父图层的部分可见区域。
     mask图层的 Color 属性是无关紧要的。mask图层实心的部分会被保留下来，其他的则会被抛弃。
     
     CALayer 蒙版图层真正厉害的地方在于蒙版图层不局限于静态图。任何有图层构成的都可以作为mask属性，这意味着你的蒙版可以通过代码甚至是动画实时生成！
     */
    
    _layerView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _layerView1.backgroundColor = [UIColor whiteColor];
    
    // 给ImageView添加图像
    _layerView1.image = [UIImage imageNamed:@"AI_200*200.jpg"];
    // 创建maskLayer
    CALayer *maskLayer = [CALayer layer];
    // 给maskLayer设定frame
    maskLayer.frame = self.layerView1.bounds;
    
    UIImage *maskImage = [UIImage imageNamed:@"star"];
    // 给图层的contents添加内容
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    self.layerView1.layer.mask = maskLayer;
    
    [self.view addSubview:_layerView1];
}

#pragma mark - view的maskView
- (void)maskViewOfView
{
    /**
     maskView的颜色不显示，最终效果图怎么显示只跟maskView每个point的alpha相关。
     当一个view设置了maskView后，那么它只会显示与maskView重叠部分，即在此图中只会显示maskView部分(maskView跟view没有层次，可以理解maskView嵌在View里)
     如果你的maskView 就是不起作用，请设置一下 maskView的背景颜色。
     可以这样理解，是将maskView每个point的alpha赋值给View的重叠部分相对应的point，这样view的重叠每个point都有个alpha值了，view重叠部分就可能显示多种透明色。
     */
    // 创建一个需要显示的视图
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    imageview.backgroundColor = [UIColor whiteColor];
    imageview.image = [UIImage imageNamed:@"AI_200*200.jpg"];
    
    // 配置maskView
    UIImageView *maskView = [[UIImageView alloc] initWithFrame:imageview.bounds];
    maskView.image = [UIImage imageNamed:@"star"];
    
    imageview.maskView = maskView;
    
    [self.view addSubview:imageview];
}































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
