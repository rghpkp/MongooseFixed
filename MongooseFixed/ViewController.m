//
//  ViewController.m
//  MongooseFixed
//
//  Created by Robert Handsfield on 8/18/13.
//  Copyright (c) 2013 Robert Handsfield. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) int currentRound;
@property (nonatomic,assign) int maxRounds;
@property (nonatomic,assign) int prepTime;

@property (nonatomic,assign) double startTime;
@property (nonatomic,assign) double currentTime;
@property (nonatomic,assign) double elapsedTime;
@property (nonatomic,assign) double roundTime;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.roundField.text = @"3";
    self.prepField.text = @"4";
    self.intervalField.text = @"2.5";
    self.currentRound = 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//fires @ 1s- counts down prep time, calls sleepTimer
- (void)prepTimeMethod:(NSTimer *)prepTimer
{
    
    //decrement the prepTime by 1s
    self.prepTime--;
    
    //display the new prepTime in the time label
    self.timeLabel.text = [NSString stringWithFormat:@"%d", self.prepTime];
    
    if (self.prepTime == 0) {
        
        //stop the prepTimer
        [self.prepTimer invalidate];
    }
     
}

//counts via system time, updates labels
- (void)sleepTimeMethod:(NSTimer *)sleepTimer
{
    
    
}

//runButton method- updates labels, calls prepTimer
- (IBAction)buttonPressed:(id)sender
{
    //get rounds from roundField
    self.maxRounds = [self.roundField.text intValue];
    NSLog(@"maxRounds = %d", self.maxRounds);
    
    //get prep time from prepField
    self.prepTime = [self.prepField.text intValue];
    NSLog(@"prepTime = %d", self.prepTime);
    
    //get round time from intervalField
    self.roundTime = [self.intervalField.text floatValue];
    NSLog(@"roundTime = %f", self.roundTime);
    
    //display the prepTime in the timeLabel
    self.timeLabel.text = self.prepField.text;
    
    //invoke the prepTimer
    
    self.prepTimer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(prepTimeMethod:) userInfo:nil repeats:YES];
    
}

@end
