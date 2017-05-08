//
//  ViewController.m
//  CATransation
//
//  Created by Apple on 15/9/11.
//  Copyright (c) 2015年 zf. All rights reserved.
//


/*CAAnimation有很多派生类
 
 CATransition 提供渐变效果:(推拉push效果,消退fade效果,揭开reveal效果)。
 
 CAAnimationGroup 允许多个动画同时播放。
 
 CABasicAnimation 提供了对单一动画的实现。

 CAKeyframeAnimation 关键桢动画,可以定义行动路线。

 CAConstraint 约束类,在布局管理器类中用它来设置属性。
 
 CAConstraintLayoutManager 约束布局管理器,是用来将多个CALayer进行布局的.各个CALayer是通过名称来区分,而布局属性是通过CAConstraint来设置的。
 
 CATransaction 事务类,可以对多个layer的属性同时进行修改.它分隐式事务,和显式事务。*/

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imgview;
}
@end

static int num=3;
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor=[UIColor whiteColor];
    
    imgview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,120, 120)];
    imgview.center=self.view.center;
    imgview.image=[UIImage imageNamed:@"fmp_icon"];
    [self.view addSubview:imgview];
    
    NSTimer *time=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(MyCAnimation1) userInfo:nil repeats:YES];
    [time fire];

}

- (void)MyCAnimation1 {
    if (num%3==0) {
         imgview.image=[UIImage imageNamed:@"icon_114"];
    }else if(num%3==1){
         imgview.image=[UIImage imageNamed:@"fmp_icon"];
    }else{
         imgview.image=[UIImage imageNamed:@"splash.jpg"];
    }
    
    CATransition *animation = [CATransition animation];
    //动画时间
    animation.duration = 1.0f;
    //display mode, slow at beginning and end
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //过渡效果
    //animation.type = kCATransitionPush;//属性效果
    animation.type = @"cube";//字符串效果
    //过渡方向
    animation.subtype = kCATransitionFromRight;
    //添加动画
    [imgview.layer addAnimation:animation forKey:nil];
    
    num++;
}

/*CATransition的type属性

1.#define定义的常量
  kCATransitionFade   交叉淡化过渡
  kCATransitionMoveIn 新视图移到旧视图上面
  kCATransitionPush   新视图把旧视图推出去
  kCATransitionReveal 将旧视图移开,显示下面的新视图
 
2.用字符串表示
  pageCurl            向上翻一页
  pageUnCurl          向下翻一页
  rippleEffect        滴水效果
  suckEffect          收缩效果，如一块布被抽走
  cube                立方体效果
  oglFlip             上下翻转效果
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
