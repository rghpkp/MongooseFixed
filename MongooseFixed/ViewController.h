//
//  ViewController.h
//  MongooseFixed
//
//  Created by Robert Handsfield on 8/18/13.
//  Copyright (c) 2013 Robert Handsfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAAnimation.h>

@interface ViewController : UIViewController
{
    UILabel *timeLabel_;
    UILabel *roundLabel_;
    NSTimer *sleepTimer_;
    NSTimer *prepTimer_;
    UITextField *roundField_;
    UITextField *prepField_;
    UITextField *intervalField_;
}

//View Object Properties
@property (retain,nonatomic) IBOutlet UILabel *roundLabel;
@property (retain,nonatomic) IBOutlet UILabel *timeLabel;

@property (retain,nonatomic) IBOutlet UITextField *roundField;
@property (retain,nonatomic) IBOutlet UITextField *prepField;
@property (retain,nonatomic) IBOutlet UITextField *intervalField;

@property (retain,nonatomic) NSTimer *sleepTimer;
@property (retain,nonatomic) NSTimer *prepTimer;

//Data Variable Properties


//runButton method- updates labels, calls prepTimer
-(IBAction)buttonPressed:(id)sender;

//executes @ 1s- counts down prep time, calls sleepTimer
-(void)prepTimeMethod:(NSTimer*)prepTimer;

//counts via system time, updates labels
-(void)sleepTimeMethod:(NSTimer*)sleepTimer;



@end
