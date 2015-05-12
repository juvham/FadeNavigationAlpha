//
//  UIImageView+fadeContent.m
//  FadeNavigationAlpha
//
//  Created by AceElvis on 15/5/12.
//  Copyright (c) 2015年 GouMin. All rights reserved.
//

#import "UIImageView+fadeContent.h"

@implementation UIImageView (fadeContent)
- (void)fadeContent:(UIImage *)image {
    
    
    //    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    //
    //    contentsAnimation.fromValue = self.image ;
    //    contentsAnimation.toValue = image;
    //
    //    contentsAnimation.duration = 1.0f;
    //
    //    contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //
    //    contentsAnimation.removedOnCompletion = YES;
    //
    //    contentsAnimation.delegate = self;
    //
    ////    contentsAnimation.autoreverses
    //
    //    [self.layer addAnimation:contentsAnimation forKey:@"contents"];
    
    self.image = image;
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    [self.layer addAnimation:transition forKey:nil];
}
@end
