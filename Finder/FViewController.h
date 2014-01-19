//
//  FViewController.h
//  Finder
//
//  Created by Diego Calvo on 1/18/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>



@interface FViewController : UIViewController {
    IBOutlet UIImageView *foodPic;
    
}
@property (nonatomic, strong) NSArray *foodChoices;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRight;
@property (nonatomic, strong) NSMutableArray *alreadyJudgedFood;

-(IBAction)didSwipeLeft:(id)sender;
-(IBAction)didSwipeRight:(id)sender;

@end
