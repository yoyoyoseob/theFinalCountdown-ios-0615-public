//
//  FISTimer.m
//  theFinalCountdown
//
//  Created by Yoseob Lee on 7/2/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISTimer.h"


@implementation FISTimer

- (void)pauseTimer:(NSTimer *)timer
{
    self.pauseStart = [NSDate date];
    self.previousFireDate = [timer fireDate];
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer:(NSTimer *)timer
{
    float pauseTime = -1*[self.pauseStart timeIntervalSinceNow];
    [timer setFireDate:[self.previousFireDate initWithTimeInterval:pauseTime sinceDate:self.previousFireDate]];
}

- (void)timerFireMethod:(NSTimer *)timer
{
    //[self.delegate timer:self didFireWithRemainingTime:self.totalSeconds];
    
    int hours = (int)self.totalSeconds / 3600;
    int minutes = ((int)self.totalSeconds % 3600) / 60;
    int seconds = (int)self.totalSeconds % 60;
    
    self.labelText.hidden = NO;
    self.labelText.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    self.totalSeconds --;
}

- (instancetype) init
{
    self = [super init];
    if (self)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
        [_timer fire];
    }
    return self;
}

-(void)invalidate
{
    [self.timer invalidate];
}



@end
