//
//  AlbumView.m
//  AnimationTest
//
//  Created by Zhang on 15/4/23.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "AlbumView.h"
@interface AlbumView(){
    UIImageView *tsImage;
    UIImageView *fImage;
    CAAnimationGroup *group;
}

@end
@implementation AlbumView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        tsImage = [[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 100, 100, 100)];
        tsImage.backgroundColor = [UIColor redColor];
        tsImage.image = [UIImage imageNamed:@"taylorswift"];
        [self addSubview:tsImage];
        
        fImage = [[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 100, 100, 100)];
        fImage.image = [UIImage imageNamed:@"Franz"];
        fImage.backgroundColor = [UIColor greenColor];
        [self addSubview:fImage];
        
        CABasicAnimation *zPosition = [CABasicAnimation animation];
        zPosition.keyPath = @"zPosition";
        zPosition.fromValue = @-1;
        zPosition.toValue = @1;
        zPosition.duration = 1.2;
        
        CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
        rotation.keyPath = @"transform.rotation";
        rotation.values = @[@0, @14, @0];
        rotation.duration = 1.2;
        rotation.timingFunctions = @[
           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
        ];
        
        CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
        position.keyPath = @"position";
        position.values = @[
           [NSValue valueWithCGPoint:CGPointZero],
           [NSValue valueWithCGPoint:CGPointMake(110, -20)],
           [NSValue valueWithCGPoint:CGPointZero]
        ];
        position.timingFunctions = @[
           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
        ];
        position.additive = YES;
        position.duration = 1.2;
        
        group = [[CAAnimationGroup alloc] init];
        group.animations = @[ rotation, position];
        group.duration = 1.2;
        group.beginTime = 0.5;
        group.removedOnCompletion = YES;
        
        [tsImage.layer addAnimation:zPosition forKey:@"shuffle"];
        tsImage.layer.zPosition = 1;
        
        UIButton *testBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((width - 100)/2, 300, 100, 50)];
        [testBtn1 setTitle:@"动画" forState:UIControlStateNormal];
        [testBtn1 addTarget:self action:@selector(btnClicked1) forControlEvents:UIControlEventTouchUpInside];
        testBtn1.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
        [self addSubview:testBtn1];
        CABasicAnimation *fzPosition = [CABasicAnimation animation];
        fzPosition.keyPath = @"zPosition";
        fzPosition.fromValue = @-1;
        fzPosition.toValue = @1;
        fzPosition.duration = 1.2;
        
        CAKeyframeAnimation *frotation = [CAKeyframeAnimation animation];
        frotation.keyPath = @"transform.rotation";
        frotation.values = @[@0, @0.14, @0];
        frotation.duration = 1.2;
        frotation.timingFunctions = @[
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                     ];
        
        CAKeyframeAnimation *fposition = [CAKeyframeAnimation animation];
        fposition.keyPath = @"position";
        fposition.values = @[
                            [NSValue valueWithCGPoint:CGPointZero],
                            [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                            [NSValue valueWithCGPoint:CGPointZero]
                            ];
        fposition.timingFunctions = @[
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                     ];
        fposition.additive = YES;
        fposition.duration = 1.2;
        
        CAAnimationGroup *fgroup = [[CAAnimationGroup alloc] init];
        fgroup.animations = @[fzPosition, frotation, fposition];
        fgroup.duration = 1.2;
        fgroup.beginTime = 0.5;
        
        [fImage.layer addAnimation:fgroup forKey:@"shuffle"];
        fImage.layer.zPosition = 1;
        
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
    [tsImage.layer addAnimation:group forKey:@"shuffle"];
}
@end
