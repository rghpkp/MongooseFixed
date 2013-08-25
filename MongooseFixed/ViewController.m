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
    self.currentRound = 1;
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
    
    if (self.prepTime == 0) {
        
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
            
            //reset the elapsed time
            self.elapsedTime = 0;
            
            //get a new interval starting time
            self.startTime = CACurrentMediaTime();
            
            //update the current round label
            self.roundLabel.text = [NSString stringWithFormat:@"Round: %d / %d",self.currentRound, self.maxRounds];
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
    
    //get prep time from prepField
    self.prepTime = [self.prepField.text intValue];
    NSLog(@"prepTime = %d", self.prepTime);
    
    //get round time from intervalField
    self.roundTime = [self.intervalField.text floatValue];
    NSLog(@"roundTime = %f", self.roundTime);
    
    //display the prepTime in the timeLabel
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %@", self.prepField.text];
    
    //invoke the prepTimer
    
    self.prepTimer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(prepTimeMethod:) userInfo:nil repeats:YES];
    
}

- (IBAction)playSound:(id)sender
{
    SystemSoundID soundID;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"tick - 1s" ofType:@"mp3"];

    NSURL *soundPathURL = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundPathURL, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
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
