//
//  ViewController.m
//  TestUIButton
//
//  Created by Paul Solt on 10/17/13.
//  Copyright (c) 2013 Paul Solt. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create with UIButtonTypeRoundedRect for dimming behavior (
    CustomButton *customButton = [CustomButton buttonWithType:UIButtonTypeRoundedRect];
    
    // buttonWithType:UIButtonTypeCustom behaves like iOS 6 buttons, it doesn't dim.
//    CustomButton *customButton = [CustomButton buttonWithType:UIButtonTypeCustom];
    
    // UIImage may take tintColor if you don't force original
    UIImage *image = [[UIImage imageNamed:@"image.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    customButton.frame = CGRectMake(100, 200, 200, 100);
    [customButton setImage:image forState:UIControlStateNormal];
    [customButton setTitle:@"Hello" forState:UIControlStateNormal];
    
    // set background image (will dim with RoundedRect type)
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    [customButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    [self.view addSubview:customButton];
    
//    
    customButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:[customButton(==100)]"
                          options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil
                          views:NSDictionaryOfVariableBindings(customButton)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:[customButton(==200)]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:nil
                          views:NSDictionaryOfVariableBindings(customButton)]];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:customButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:customButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
