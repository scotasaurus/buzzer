//
//  BZZBuzzViewController.m
//  Buzzer
//
//  Created by rdaly on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZBuzzViewController.h"

@interface BZZBuzzViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buzzButton;

@end

@implementation BZZBuzzViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createAnimation];
    
    
   // [_buzzButton.layer removeAllAnimations];
}

- (void)createAnimation
{
    CABasicAnimation *theAnimation;
    
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=1.0;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.7];
    [_buzzButton.layer addAnimation:theAnimation forKey:@"animateOpacity"];

 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
