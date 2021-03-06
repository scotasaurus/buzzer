//
//  BZZBuzzButton.m
//  Buzzer
//
//  Created by rdaly on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZBuzzButton.h"

@implementation BZZBuzzButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CABasicAnimation *theAnimation;
        
        theAnimation=[CABasicAnimation animationWithKeyPath:@"alpha"];
        theAnimation.duration=1.0;
        theAnimation.repeatCount=HUGE_VALF;
        theAnimation.autoreverses=YES;
        theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
        theAnimation.toValue=[NSNumber numberWithFloat:0.0];
        
        //theAnimation.fromValue = [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
        //theAnimation.toValue = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        [self.layer addAnimation:theAnimation forKey:@"animateAlpha"]; //myButton.layer instead of
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
