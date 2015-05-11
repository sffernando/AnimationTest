//
//  RocketView.m
//  AnimationTest
//
//  Created by Zhang on 15/4/23.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "RocketView.h"

@interface RocketView (){
    UIImageView *rocketImage;
    CABasicAnimation *animation;
}
@end
@implementation RocketView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        rocketImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 33, 36, 36)];
        rocketImage.image = [UIImage imageNamed:@"rockets"];
        rocketImage.transform = CGAffineTransformMakeRotation(M_PI_4);
        [self addSubview:rocketImage];
        
        UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, height-100, width, 50)];
        [testBtn setTitle:@"click" forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        testBtn.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
        [self addSubview:testBtn];
        
        animation = [CABasicAnimation animation];
        animation.keyPath = @"position.x";
        animation.fromValue = @40;
        animation.toValue = @400;
        animation.duration = 1;
        animation.repeatCount = FLT_MAX;
        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :0 :0.9 :0.7];
        
        [rocketImage.layer addAnimation:animation forKey:@"basic"];
        
        rocketImage.layer.position = CGPointMake(0, 33);
        
    }
    return self;
}

- (void)btnClicked{
    [self removeFromSuperview];
}
@end
