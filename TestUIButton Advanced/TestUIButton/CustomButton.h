//
//  CustomButton.h
//  TestUIButton
//
//  Created by Paul Solt on 10/17/13.
//  Copyright (c) 2013 Paul Solt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    TOP,
    RIGHT,
    BOTTOM,
    LEFT,
}PSPosition;

@interface CustomButton : UIButton {
    PSPosition _imageViewState;
}

@end
