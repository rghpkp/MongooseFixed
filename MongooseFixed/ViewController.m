//
//  ViewController.m
//  MongooseFixed
//
//  Created by Robert Handsfield on 8/18/13.
//  Copyright (c) 2013 Robert Handsfield. All rights reserved.
//
/************************************************************
 Run button invokes the prepTimer, which counts down the prep
 time, then calls the sleep timer, which counts down the time
 for each round and updates the view accordingly.
************************************************************/


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

//fires @ 1s- counts down prep time, calls sleepTimer
- (void)prepTimeMethod:(NSTimer *)prepTimer
{
    
    //decrement the prepTime by 1s
    self.prepTime--;
    
    //display the new prepTime in the time label
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %d", self.prepTime];
    
    //count down last 3 prep seconds w/ tick sound
    if (self.prepTime < 4 && self.prepTime > 0) {

        //play the tick sound
        [self playSoundMethod:@"tick - 1s"];
    }
        //when prep ends
    else if (self.prepTime == 0) {
        
        //get the stop watch starting time
        self.startTime = CACurrentMediaTime();
        
        //call the sleepTimer
        self.sleepTimer = [NSTimer scheduledTimerWithTimeInterval:.005 target:self selector:@selector(sleepTimeMethod:) userInfo:nil repeats:YES];
        
        //display round 1 in the roundLabel
        self.roundLabel.text = [NSString stringWithFormat:@"Round: %d / %d",self.currentRound, self.maxRounds];
        
        //stop the prepTimer
        [self.prepTimer invalidate];
    }
    
    
}

//fires every 5ms, counts via system time, updates labels
- (void)sleepTimeMethod:(NSTimer *)sleepTimer
{
    do //for the current round
    {
        //calculate the current elapsed time
        self.elapsedTime = CACurrentMediaTime() - self.startTime;
        
        //if round hasn't ended
        if (self.elapsedTime <= self.roundTime) {
            
            //update the clock label w/ the elapsed time
            self.timeLabel.text = [NSString stringWithFormat:@"Time: %.2f",self.elapsedTime];
            
        }
        //if round has ended
        else {
            //increment the round
            self.currentRound++;
            NSLog(@"currentRound = %d",self.currentRound);
            
            //get a new random interval
            //here
            
            //reset the elapsed time
            self.elapsedTime = 0;
            
            //get a new interval starting time
            self.startTime = CACurrentMediaTime();
            
            //update the current round label
            if (self.currentRound <= self.maxRounds) {
                self.roundLabel.text = [NSString stringWithFormat:@"Round: %d / %d",self.currentRound, self.maxRounds];
            }
            
            
            //if this is the last round
            if (self.currentRound >= self.maxRounds+1) {
                [self playSoundMethod:@"end beep"];
                [self.sleepTimer invalidate];
                break;
            }
            //if this is not the last round
            else {
                [self playSoundMethod:@"beep-7"];
            }
        }
        
    }while(self.currentRound >= self.maxRounds+1);
    //not sure why this loop condition must be so complicated to work
}

//runButton method- updates labels, calls prepTimer
- (IBAction)buttonPressed:(id)sender
{
    //get rounds from roundField
    self.maxRounds = [self.roundField.text intValue];
    NSLog(@"maxRounds = %d", self.maxRounds);
    
    //set the current round to 1
    self.currentRound = 1;
    
    //update the roundLable
    self.roundLabel.text = [NSString stringWithFormat:@"Round: %d / %d",self.currentRound, self.maxRounds];
    
    //get prep time from prepField
    self.prepTime = [self.prepField.text intValue];
    NSLog(@"prepTime = %d", self.prepTime);
    
    //get round time from intervalField
    self.roundTime = [self.intervalField.text floatValue];
    NSLog(@"roundTime = %f", self.roundTime);
    
    //display the prepTime in the timeLabel
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %@", self.prepField.text];
    
    //initialize elapsed time
    self.elapsedTime = 0;
    
    //get a random interval
    //here
    
    //invoke the prepTimer
    self.prepTimer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(prepTimeMethod:) userInfo:nil repeats:YES];
    
}

- (void)playSoundMethod:(NSString *)soundFileName
{
    SystemSoundID soundID;
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:soundFileName ofType:@"mp3"];
    
    NSURL *soundPathURL = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundPathURL, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}

@end
