//
//  ViewController.h
//  MongooseFixed
//
//  Created by Robert Handsfield on 8/18/13.
//  Copyright (c) 2013 Robert Handsfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAAnimation.h>
#import <AudioToolbox/AudioToolbox.h>



@interface ViewController : UIViewController
{
    UILabel *timeLabel_;
    UILabel *roundLabel_;
    NSTimer *sleepTimer_;
    NSTimer *prepTimer_;
    UITextField *roundField_;
    UITextField *prepField_;
    UITextField *minIntervalField_;
    UITextField *maxIntervalField_;
}

//View Object Properties
@property (retain,nonatomic) IBOutlet UILabel *roundLabel;
@property (retain,nonatomic) IBOutlet UILabel *timeLabel;

@property (retain,nonatomic) IBOutlet UITextField *roundField;
@property (retain,nonatomic) IBOutlet UITextField *prepField;
@property (retain,nonatomic) IBOutlet UITextField *minIntervalField;
@property (retain,nonatomic) IBOutlet UITextField *maxIntervalField;

@property (retain,nonatomic) NSTimer *sleepTimer;
@property (retain,nonatomic) NSTimer *prepTimer;


//runButton method- updates labels, calls prepTimer
-(IBAction)buttonPressed:(id)sender;

//executes @ 1s- counts down prep time, calls sleepTimer
-(void)prepTimeMethod:(NSTimer *)prepTimer;

//counts via system time, updates labels
-(void)sleepTimeMethod:(NSTimer *)sleepTimer;

-(void)playSoundMethod:(NSString *)soundFileName;

//releases the text field first responder
-(IBAction)textFieldReturn:(id)sender;

@end
