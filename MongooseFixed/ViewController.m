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
@property (nonatomic,assign) int maxRound;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//executes @ 1s- counts down prep time, calls sleepTimer
- (void)prepTimeMethod:(NSTimer *)prepTimer prepTimeArg:(NSInteger)prepTime
{
    
}

//counts via system time, updates labels
- (void)sleepTimeMethod:(NSTimer *)sleepTimer
{
    
}

//runButton method- updates labels, calls prepTimer
- (IBAction)buttonPressed:(id)sender
{
    
}

@end
