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
    [self layoutIfNeeded];
    [self setNeedsUpdateConstraints];  // fixes initial layout

}

/*- (void)layoutSubviews {
    [super layoutSubviews];

//    [self removeConstraints:self.constraints];
//    [self updateConstraintsIfNeeded];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    view.userInteractionEnabled = YES;

    [self addSubview:view];
//    [self insertSubview:view aboveSubview:self];
    
    [self.imageView removeFromSuperview];
    [self.titleLabel removeFromSuperview];
    
//    [self addSubview:self.imageView];
//    [self addSubview:self.titleLabel];
    
    [view addSubview:self.imageView];
    [view addSubview:self.titleLabel];
//
    NSLog(@"Layout");
}*/
//- (void)updateConstraints
//- (CGSize)intrinsicContentSize {
//    return CGSizeMake(200, 100);
//}


- (void)updateConstraints {
    // Call first, because we're going to replace constraints with our own
    [super updateConstraints];

    NSLog(@"_state %d", _imageViewState);

    [self removeConstraints:self.constraints];

//    self.translatesAutoresizingMaskIntoConstraints = NO;


    // TODO: Idea remove the offending party from the view heirachy
Class myClass = NSClassFromString(@"_UIButtonContentCenteringSpacer");
    NSLog(@"Class: %@", [myClass description]);
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Rotate ImageView around the button with each press
    // Remove constraints
    
//    [self removeConstraints:self.constraints];
    


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
            
            // Hug the left side of the button (FAILS)
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
    

    
//    NSLog(@"self1: %@", self.constraints);
//    NSLog(@"image1: %@", self.imageView.constraints);

    // Always call at end

    NSLog(@"self2: %@", self.constraints);
//    NSLog(@"image2: %@", self.imageView.constraints);

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
