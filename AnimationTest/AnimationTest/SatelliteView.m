//
//  SatelliteView.m
//  AnimationTest
//
//  Created by Zhang on 15/4/23.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "SatelliteView.h"

@implementation SatelliteView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake((width-200)/2, (width-200)/2, 200, 200)];
        circleView.layer.cornerRadius = 100;
        circleView.backgroundColor = [UIColor colorWithRed:0.370 green:0.345 blue:0.872 alpha:1.000];
        [self addSubview:circleView];
        
        UIImageView *satellite = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"satellite"]];
        satellite.frame = CGRectMake(0, 0, 50, 50);
        [self addSubview:satellite];
        
        CGRect boundingRect = CGRectMake(20, 20, width-90, width-90);
        CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
        orbit.keyPath = @"position";
        orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
        orbit.duration = 4;
        orbit.additive = YES;
        orbit.repeatCount = HUGE_VALF;
        orbit.calculationMode = kCAAnimationPaced;
        orbit.rotationMode = kCAAnimationRotateAuto;//nil
        
        [satellite.layer addAnimation:orbit forKey:@"orbit"];
        
        UIView *circleView1 = [[UIView alloc] initWithFrame:CGRectMake((width-200)/2, 300 + (width-200)/2, 200, 200)];
        circleView1.layer.cornerRadius = 100;
        circleView1.backgroundColor = [UIColor colorWithRed:0.370 green:0.345 blue:0.872 alpha:1.000];
        [self addSubview:circleView1];
        
        UIImageView *satellite1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"satellite"]];
        satellite1.frame = CGRectMake(0, 0, 50, 50);
        [self addSubview:satellite1];
        
        
        CGRect boundingRect1 = CGRectMake(20, 320, width-90, width-90);
        CAKeyframeAnimation *orbit1 = [CAKeyframeAnimation animation];
        orbit1.keyPath = @"position";
        orbit1.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect1, NULL));
        orbit1.duration = 4;
        orbit1.additive = YES;
        orbit1.repeatCount = HUGE_VALF;
        orbit1.calculationMode = kCAAnimationPaced;
        orbit1.rotationMode = nil;
        [satellite1.layer addAnimation:orbit1 forKey:@"orbit1"];

        
        
        UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, height-60, width, 50)];
        [testBtn setTitle:@"click" forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        testBtn.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
        [self addSubview:testBtn];
    }
    return self;
}
- (void)btnClicked{
    [self removeFromSuperview];
}
@end
