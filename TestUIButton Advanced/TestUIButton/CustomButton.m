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

        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

        [self removeConstraints:self.constraints];
//        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)buttonPressed:(id)sender {
    // Switch between states
    _imageViewState += 1;
    _imageViewState %= 4;
    NSLog(@"_state %d", _imageViewState);
    
    [self setNeedsUpdateConstraints];
}

- (void)didMoveToSuperview {
     NSLog(@"super: %@", self.constraints);
}


- (void)updateConstraints {
    // Always call at end
    [super updateConstraints];

//    self.translatesAutoresizingMaskIntoConstraints = YES;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Rotate ImageView around the button with each press
    // Remove constraints
    
    NSLog(@"self1: %@", self.constraints);

    [self removeConstraints:self.constraints];
    
    NSLog(@"self2: %@", self.constraints);

    // Use a local variable to use the constraint visual format (i.e periods don't work for self.view)
    UIImageView *imageView = self.imageView;
    UILabel *titleLabel = self.titleLabel;
    
    switch (_imageViewState) {
        case LEFT:
            // Stretch imageView vertically
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
            
            // Hug the right side of the button
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView][titleLabel]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self, titleLabel)]];

            // Center Y label
            [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
            break;
        case RIGHT:
            // Stretch imageView vertically
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
            
            // Hug the left side of the button
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[titleLabel][imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self, titleLabel)]];

            // Center Y label
            [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];

            break;
        case TOP:
            // Hug the top side of the button
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView][titleLabel]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self, titleLabel)]];
            
            // Stretch imageView horizontally
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
            
            // Center X
            [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

            
            break;
        case BOTTOM:
            // Hug the bottom side of the button
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel][imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self, titleLabel)]];
            
            // Stretch imageView horizontally
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView, self)]];
            
            // Center X
            [self addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

            break;
        default:
            break;
    }
    
    
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
