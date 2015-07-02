//
//  FISTimer.h
//  theFinalCountdown
//
//  Created by Yoseob Lee on 7/2/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>


//@class FISTimer;
//
//@protocol FISTimerDelegate <NSObject>
//
//-(void)timer:(FISTimer *)timer didFireWithRemainingTime:(NSTimeInterval)remainingTime;
//
//@end

@interface FISTimer : NSObject
@property (weak, nonatomic) NSDate *pauseStart;
@property (weak, nonatomic) NSDate *previousFireDate;
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) UILabel *labelText;
@property (nonatomic) NSTimeInterval totalSeconds;

//@property (weak, nonatomic) id<FISTimerDelegate> delegate;

- (void)pauseTimer:(NSTimer *)timer;
- (void)resumeTimer:(NSTimer *)timer;
- (void)timerFireMethod:(NSTimer *)timer;
- (instancetype) init;
- (void)invalidate;

@end
