//
//  TWNotification.m
//  TWNotification
//
//  Created by Pigi Galdi on 09/09/12.
//  Copyright (c) 2012 Pigi Galdi. All rights reserved.
//

#import "TWNotification.h"

@implementation TWNotification

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Set up label.
        _notificationText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        [_notificationText setTextColor:[UIColor whiteColor]];
        [_notificationText setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_notificationText setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_notificationText];
    }
    return self;
}

// Init methods.
- (id)initWithTitle:(NSString *)twTitle message:(NSString *)twMessage withStyle:(TWNotificationStyle)twStyle inView:(UIView *)userView hideAfter:(float)twTimer
{
    // Self set frame.
    [self initWithFrame:CGRectMake(0, -20, 320, 20)];
    self = [super init];
    
    // Let know the message type.
    if (twStyle == TWNotificationStyleMessage) {
        [_notificationText setBackgroundColor:[UIColor blackColor]];
    }else if (twStyle == TWNotificationStyleSuccess) {
        [_notificationText setBackgroundColor:[UIColor colorWithRed:0.001 green:0.500 blue:0.001 alpha:1.000]];
    }else if (twStyle == TWNotificationStyleError) {
        [_notificationText setBackgroundColor:[UIColor colorWithRed:0.666 green:0.000 blue:0.007 alpha:1.000]];
    }
    
    // Set user text to label.
    [_notificationText setText:[NSString stringWithFormat:@" %@: %@", twTitle, twMessage]];
    
    // Add notification view to userView.
    [userView addSubview:self];
    
    // Show the notification.
    [self showAndHideAfter:twTimer];
    
    return self;
}

- (void)showAndHideAfter:(float)timeToHide
{
    // hide statusbar.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [self performSelector:@selector(close) withObject:nil afterDelay:timeToHide];
}

- (void)close
{
    // show status bar.
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [self release];
}

- (void)dealloc
{
    [_notificationText release];
    [super dealloc];
}
@end