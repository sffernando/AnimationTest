//
//  ViewController.m
//  AnimationTest
//
//  Created by Zhang on 15/4/20.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "ViewController.h"
#import "SatelliteView.h"
#import "RectangleView.h"
#import "RocketView.h"
#import "LockView.h"
#import "AlbumView.h"

@interface ViewController (){
    UIImageView *testImage;
    BOOL heiehi;
    CABasicAnimation *animation;
    SatelliteView *sView;
    RectangleView *rectangle;
    RocketView *rocketView;
    LockView *lockView;
    AlbumView *albumView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150)/2, 50, 150, 150)];
    testView.layer.cornerRadius = 75;
    testView.backgroundColor = [UIColor colorWithRed:0.000 green:0.500 blue:0.000 alpha:0.330];
    testView.clipsToBounds = YES;
    [self.view addSubview:testView];
    
    testImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rocket"]];
    testImage.frame = CGRectMake(60, 90, 30, 60);
    [testView addSubview:testImage];
    
    animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @90;
    animation.toValue = @-60;
    animation.duration = 1;
    
    
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    
    
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, testView.frame.origin.y + testView.frame.size.height + 30, (self.view.frame.size.width-80)/2, 50)];
    [testBtn setTitle:@"垂直火箭" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    testBtn.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn];
    
    UIButton *testBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 20, testView.frame.origin.y + testView.frame.size.height + 30, (self.view.frame.size.width-80)/2, 50)];
    [testBtn1 setTitle:@"卫星" forState:UIControlStateNormal];
    [testBtn1 addTarget:self action:@selector(btnClicked1) forControlEvents:UIControlEventTouchUpInside];
    testBtn1.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn1];

    UIButton *testBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(20, testView.frame.origin.y + testView.frame.size.height + 100, (self.view.frame.size.width-80)/2, 50)];
    [testBtn2 setTitle:@"红方块" forState:UIControlStateNormal];
    [testBtn2 addTarget:self action:@selector(btnClicked2) forControlEvents:UIControlEventTouchUpInside];
    testBtn2.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn2];
    
    UIButton *testBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 20, testView.frame.origin.y + testView.frame.size.height + 100, (self.view.frame.size.width - 80)/2, 50)];
    [testBtn3 setTitle:@"水平火箭" forState:UIControlStateNormal];
    [testBtn3 addTarget:self action:@selector(btnClicked3) forControlEvents:UIControlEventTouchUpInside];
    testBtn3.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn3];
    
    UIButton *testBtn4 = [[UIButton alloc] initWithFrame:CGRectMake( 20, testView.frame.origin.y + testView.frame.size.height + 170, (self.view.frame.size.width - 80)/2, 50)];
    [testBtn4 setTitle:@"shake" forState:UIControlStateNormal];
    [testBtn4 addTarget:self action:@selector(btnClicked4) forControlEvents:UIControlEventTouchUpInside];
    testBtn4.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn4];
    
    UIButton *testBtn5 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 20, testView.frame.origin.y + testView.frame.size.height + 170, (self.view.frame.size.width - 80)/2, 50)];
    [testBtn5 setTitle:@"相册" forState:UIControlStateNormal];
    [testBtn5 addTarget:self action:@selector(btnClicked5) forControlEvents:UIControlEventTouchUpInside];
    testBtn5.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
    [self.view addSubview:testBtn5];
}

- (void)btnClicked{
    heiehi = !heiehi;
    if (heiehi) {
        [testImage.layer addAnimation:animation forKey:@"basic"];
    }else{
        [testImage.layer removeAnimationForKey:@"basic"];
    }
}

- (void)btnClicked1{
    heiehi = !heiehi;
    if (sView == nil) {
        sView =[[SatelliteView alloc] initWithFrame:self.view.bounds];
    }
    [self.view addSubview:sView];
}

- (void)btnClicked2{
    if (rectangle == nil) {
        rectangle = [[RectangleView alloc] initWithFrame:self.view.bounds];
    }
    [self.view addSubview:rectangle];
}

- (void)btnClicked3{
    if (rocketView == nil) {
        rocketView = [[RocketView alloc] initWithFrame:self.view.bounds];
    }
    [self.view addSubview:rocketView];
}

- (void)btnClicked4{
    if (lockView == nil){
        lockView = [[LockView alloc] initWithFrame:self.view.bounds];
    }
    [self.view addSubview:lockView];
}

- (void)btnClicked5{
    if (albumView == nil) {
        albumView = [[AlbumView alloc] initWithFrame:self.view.bounds];
    }
    [self.view addSubview:albumView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
