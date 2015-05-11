//
//  RectangleView.m
//  AnimationTest
//
//  Created by Zhang on 15/4/23.
//  Copyright (c) 2015年 Zhang. All rights reserved.
//

#import "RectangleView.h"

@interface RectangleView()<UIPickerViewDelegate, UIPickerViewDataSource>{
    UIView  *rectangle;
    CABasicAnimation *animation;
    UIPickerView  *pickerView;
    NSArray *dataArray;
}

@end

@implementation RectangleView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.backgroundColor = [UIColor whiteColor];
        
        rectangle = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
        rectangle.backgroundColor = [UIColor redColor];
        [self addSubview:rectangle];
        
        animation = [CABasicAnimation animation];
        animation.keyPath = @"position.x";
        animation.fromValue = @50;
        animation.toValue = @300;
        animation.duration = 1;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [rectangle.layer addAnimation:animation forKey:@"basic"];
        rectangle.layer.position = CGPointMake(300, 100);
        
        
        UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, height-100, width, 50)];
        [testBtn setTitle:@"click" forState:UIControlStateNormal];
        [testBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        testBtn.backgroundColor = [UIColor colorWithRed:0.000 green:0.618 blue:0.500 alpha:0.510];
        [self addSubview:testBtn];
        
        dataArray = [NSArray arrayWithObjects:@"kCAMediaTimingFunctionLinear",@"kCAMediaTimingFunctionEaseIn",@"kCAMediaTimingFunctionEaseOut",@"kCAMediaTimingFunctionEaseInEaseOut",@"kCAMediaTimingFunctionDefault", nil];
        pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 300, width, 100)];
        pickerView.dataSource = self;
        pickerView.delegate = self;
        [self addSubview:pickerView];

    }
    return self;
}

- (void)btnClicked{
    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [dataArray objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [rectangle.layer removeAnimationForKey:@"basic"];
    if (dataArray.count > row) {
        switch (row) {
            case  0:
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                break;
                
            case  1:
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                break;
                
            case  2:
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                break;
                
            case  3:
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                break;
                
            case  4:
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
                break;
                
            default:
                break;
        }
    }
    [rectangle.layer addAnimation:animation forKey:@"basic"];
    
}

@end
