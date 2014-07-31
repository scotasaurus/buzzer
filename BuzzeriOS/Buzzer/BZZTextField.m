//
//  BZZTextField.m
//  Buzzer
//
//  Created by rdaly on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZTextField.h"



@implementation BZZTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.borderWidth= 1.0f;
        self.borderStyle=UITextBorderStyleNone;
        self.backgroundColor=[UIColor whiteColor];
        self.layer.masksToBounds=YES;
        [self setBorderForColor:[UIColor whiteColor] width:1.0f radius:1.0f];

        [self.layer setDelegate:self];
        [self setNeedsDisplay];

    }
    return self;
}

- (void)setBorderForColor:(UIColor *)color
                    width:(float)width
                   radius:(float)radius
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}


- (id <CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:event]; // Default Animation for 'event'
        ani.duration = 0.5; // Your custom animation duration
        return ani;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)becomeFirstResponder {
    BOOL outcome = [super becomeFirstResponder];
    if (outcome) {
        [self setBorderForColor:[UIColor lightGrayColor] width:1.0f radius:1.0f];

    }
    return outcome;
}

- (BOOL)resignFirstResponder {
    BOOL outcome = [super resignFirstResponder];
    if (outcome) {
        [self setBorderForColor:[UIColor whiteColor] width:1.0f radius:1.0f];
}
    return outcome;
}


@end
