//
//  HomeViewController.h
//  Memify
//
//  Created by Ryan Sickles on 7/4/14.
//  Copyright (c) 2014 sickles.ryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "MediaTypeSelectionViewController.h"
#import "DropAnimationController.h"
#import <Parse/Parse.h>
#import "CardView.h"
@class LoginViewController;

@interface HomeViewController : UIViewController <NSURLConnectionDelegate,UIViewControllerTransitioningDelegate,MDCSwipeToChooseDelegate>
{
    NSMutableData *_imageData;
    LoginViewController *login;
}
- (IBAction) memeSend:(id)sender;
- (void)retrieveCards;
@property (nonatomic,strong) UIColor *mainColor;
@property (nonatomic,strong) NSString *boldFontName;
@property (strong,nonatomic) NSString *userId;
@property (nonatomic, retain) NSTimer *refreshTimer;
@property (strong,nonatomic) NSNumber *active_state;
@property (strong,nonatomic) NSNumber *flipped;
//card properties
@property (nonatomic, strong) Card *currentCard;
@property (nonatomic, strong) CardView *frontCardView;
@property (nonatomic, strong) CardView *backCardView;
@property (nonatomic, strong) NSString *senderName;
@end
