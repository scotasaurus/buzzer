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
        self.backgroundColor=[UIColor lightGrayColor];
        self.layer.masksToBounds=YES;
        [self setBorderForColor:[UIColor lightGrayColor] width:1.0f];

        [self.layer setDelegate:self];

    }
    return self;
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    UIColor *color = [UIColor darkGrayColor];
    
    UIFont *font = [UIFont systemFontOfSize:14.0];
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle,
                                  NSForegroundColorAttributeName: color};
    NSUInteger size = self.attributedText.size.height;
    
    rect.origin.y += (rect.size.height - size)/2 - 2;
    
    [[self placeholder] drawInRect:rect withAttributes:attributes];
}

- (void)setBorderForColor:(UIColor *)color
                    width:(float)width
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}


- (id <CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:event]; // Default Animation for 'event'
        ani.duration = 0.3; // Your custom animation duration
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
        [self setBorderForColor:[UIColor whiteColor] width:1.0f];

    }
    return outcome;
}

- (BOOL)resignFirstResponder {
    BOOL outcome = [super resignFirstResponder];
    if (outcome) {
        [self setBorderForColor:[UIColor lightGrayColor] width:1.0f];
}
    return outcome;
}


@end
