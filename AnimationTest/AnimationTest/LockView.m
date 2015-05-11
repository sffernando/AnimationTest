//
//  LockView.m
//  AnimationTest
//
//  Created by Zhang on 15/4/24.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "LockView.h"
@interface LockView  () <UITextFieldDelegate>{
    UIView  *passwordView;
    UITextField *password;
    UIImageView *lockImg;
    CAKeyframeAnimation *animation;
}
@end
@implementation LockView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        passwordView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, width-60, 66)];
        passwordView.layer.cornerRadius = 4.0;
        passwordView.layer.borderWidth = 1.0;
        passwordView.layer.borderColor = [UIColor colorWithWhite:0.000 alpha:0.500].CGColor;
        passwordView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.490];
        
        lockImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 42, 42)];
        lockImg.image = [UIImage imageNamed:@"lock"];
        [passwordView addSubview:lockImg];
        
        password = [[UITextField alloc] initWithFrame:CGRectMake(66, 12, width-126, 42)];
        password.text = @"shiyufan";
        password.delegate = self;
        password.secureTextEntry = YES;
        
        [passwordView addSubview:password];
        
        [self addSubview:passwordView];
        
        animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"position.x";
        animation.values = @[@0, @10,@-10, @10, @0];
        animation.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1];
        animation.duration = .4;
        animation.additive = YES;
        animation.removedOnCompletion = YES;
        [passwordView.layer addAnimation:animation forKey:@"shake"];
        
        UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        goBtn.frame = CGRectMake(120, 240, width-240, 44);
        [goBtn setTitle:@"动起来" forState:UIControlStateNormal];
        [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [goBtn addTarget:self action:@selector(btnClicked1) forControlEvents:UIControlEventTouchUpInside];
        goBtn.backgroundColor = [UIColor colorWithRed:1.000 green:0.240 blue:0.303 alpha:0.510];
        [self addSubview:goBtn];
        
        UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, height-100, width, 50)];
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

- (void)btnClicked1{
    [passwordView.layer addAnimation:animation forKey:@"shake"];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [password resignFirstResponder];
    return YES;
}

@end
