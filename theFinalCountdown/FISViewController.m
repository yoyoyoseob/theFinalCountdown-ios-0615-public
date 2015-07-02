//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

- (IBAction)startButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;
- (IBAction)pauseButtonTapped:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTapped:(id)sender
{
    self.totalSeconds = self.datePicker.countDownDuration;
    self.isPaused = NO;
    
    self.myTimer = [[FISTimer alloc]init];
    self.myTimer.labelText = self.timerLabel;
    self.myTimer.totalSeconds = self.datePicker.countDownDuration;

    self.datePicker.hidden = YES;
    self.pauseButton.enabled = YES;
    self.startButton.hidden = YES;
    self.cancelButton.hidden = NO;
}

- (IBAction)cancelButtonTapped:(id)sender
{
    self.totalSeconds = 0;
    [self.myTimer invalidate];
    
    self.pauseButton.enabled = NO;
    self.timerLabel.hidden = YES;
    self.datePicker.hidden = NO;
    self.cancelButton.hidden = YES;
    self.startButton.hidden = NO;
}

- (IBAction)pauseButtonTapped:(id)sender
{
    if (self.isPaused)
    {
        [self updateButtonToPause];
        [self.myTimer resumeTimer:self.myTimer.timer];
        self.isPaused = NO;
    }
    else
    {
        [self updateButtonToResume];
        [self.myTimer pauseTimer:self.myTimer.timer];
        self.isPaused = YES;
    }
}

- (void)updateButtonToResume
{
    [self.pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
    [self.pauseButton setTitleColor:[UIColor colorWithRed:42.0/255.0 green:200.0/255.0 blue:69.0/255.0 alpha:1] forState:UIControlStateNormal];
}

- (void)updateButtonToPause
{
    [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [self.pauseButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
}

@end
