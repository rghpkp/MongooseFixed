//
//  ViewController.h
//  MongooseFixed
//
//  Created by Robert Handsfield on 8/18/13.
//  Copyright (c) 2013 Robert Handsfield. All rights reserved.
//

#import <UIKit/UIKit.h>

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


@property (retain,nonatomic) IBOutlet UILabel *timeLabel;
@property (retain,nonatomic) IBOutlet UILabel *roundLabel;
@property (retain,nonatomic) NSTimer *sleepTimer;
@property (retain,nonatomic) NSTimer *prepTimer;
@property (retain,nonatomic) IBOutlet UITextField *roundField;
@property (retain,nonatomic) IBOutlet UITextField *prepField;
@property (retain,nonatomic) IBOutlet UITextField *intervalField;


@end
