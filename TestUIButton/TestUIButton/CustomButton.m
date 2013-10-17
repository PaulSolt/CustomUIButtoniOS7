//
//  CustomButton.m
//  TestUIButton
//
//  Created by Paul Solt on 10/17/13.
//  Copyright (c) 2013 Paul Solt. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // set a color to see extent of UIButton
//        self.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5];

        
        
    }
    return self;
}

- (void)updateConstraints {
    
    // Remove constraints
    [self removeConstraints:self.imageView.constraints];
    
    // Use a local variable to use the constraint visual format (i.e periods don't work for self.view)
    UIImageView *imageView = self.imageView;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Stretch imageView vertically
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
    
    // Hug the right side of the button
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
    
    // Always call at end
    [super updateConstraints];
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
