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

@end
