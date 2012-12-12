//
//  ViewController.m
//  TouchTest
//
//  Created by liuwei on 12-12-9.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "ViewController.h"

#define kMiniLength 25
#define kMax  5

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    
    self.view.multipleTouchEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateLabelFromTouches: (NSSet *) touches
{
    //获取轻击数量
    NSInteger numOfTaps = [[touches anyObject]tapCount];
    //获取触摸到的数量
    NSInteger numOfTouches = [touches count];
    //finger position
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    self.label.text = [NSString stringWithFormat:@"taps count:%d, touch count:%d, \npoint x:%f, point y:%f", numOfTaps, numOfTouches, point.x, point.y];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateLabelFromTouches:touches];
    self.startPoint = [[touches anyObject] locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //finger position
    CGPoint currentPosition = [[touches anyObject] locationInView:self.view];
    
    self.label2.text = [NSString stringWithFormat:@"new point x:%f, point y:%f", currentPosition.x, currentPosition.y];
    
    CGFloat moveX = currentPosition.x - self.startPoint.x;
    CGFloat moveY = currentPosition.y - self.startPoint.y;
    
    if (moveX > 0) {
        self.label2.text = [NSString stringWithFormat:@"%@\nmoved right",self.label2.text];
    }
    else
    {
        self.label2.text = [NSString stringWithFormat:@"%@\nmoved left",self.label2.text];
    }
    if (moveY < 0) {
        self.label2.text = [NSString stringWithFormat:@"%@\nmoved top",self.label2.text];
    }
    else
    {
        self.label2.text = [NSString stringWithFormat:@"%@\nmoved down",self.label2.text];
    }
}


- (void)dealloc {
    [_label release];
    [_imageView release];
    [_label2 release];
    [super dealloc];
}
@end
