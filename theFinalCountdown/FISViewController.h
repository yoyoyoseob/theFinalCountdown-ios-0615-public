//
//  FISViewController.h
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISTimer.h"

@interface FISViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) NSDate *pauseStart;
@property (weak, nonatomic) NSDate *previousFireDate;
@property (nonatomic) BOOL isPaused;
@property (nonatomic, strong) FISTimer *myTimer;
@property (nonatomic) NSTimeInterval totalSeconds;

@end
