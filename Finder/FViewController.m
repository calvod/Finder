//
//  FViewController.m
//  Finder
//
//  Created by Diego Calvo on 1/18/14.
//  Copyright (c) 2014 Diego Calvo. All rights reserved.
//

#import "FViewController.h"
#import <Parse/Parse.h>

@interface FViewController ()

@end

@implementation FViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeRight:)];
    self.swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeLeft:)];
    [self.swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
	// Do any additional setup after loading the view, typically from a nib.
    
    _foodChoices = [[NSArray alloc] initWithObjects:@"fries.png", @"pretzel.png", @"cheesesticks.png", @"cheetos.png", @"breadsticks.png", @"nuggets.png", nil];

    [foodPic setImage:[UIImage imageNamed:@"banana.png"]];
    
    self.alreadyJudgedFood = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *myTouch = [[event allTouches] anyObject];
//    foodPic.center = [myTouch locationInView:nil];
//    
//    if (foodPic.center.x > 270 || foodPic.center.x < 50) {
//        //add this to "Likes"
//        NSMutableArray* likesArray = [[PFUser currentUser] objectForKey:@"likes"];
//        if(likesArray == nil) {
//            likesArray = [[NSMutableArray alloc] init];
//        }
//        
//        PFObject* caviar = [PFObject objectWithClassName:@"Food"];
//        caviar[@"name"] = @"Caviar";
////        [caviar saveInBackground];
//        
//        PFObject* like = [PFObject objectWithClassName:@"Like"];
//        like[@"food"] = caviar;
//        
//        [likesArray addObject:like];
//        [PFUser currentUser][@"likes"] = likesArray;
//        
//        [[PFUser currentUser] saveInBackground];
//        
//        int random = arc4random_uniform(self.foodChoices.count);
//        [foodPic setImage:[UIImage imageNamed:[self.foodChoices objectAtIndex:random]]];
//        
//        foodPic.center = CGPointMake(160, 284);
//        
//    }
//    
//}

-(IBAction)didSwipeLeft:(id)sender {
    [foodPic isHighlighted];
    if (self.foodChoices.count == self.alreadyJudgedFood.count) {
        [foodPic setImage:[UIImage imageNamed:@"sorry.png"]];
    } else {
        int random = -1;
        while (random == -1 || [self.alreadyJudgedFood containsObject:[NSNumber numberWithInt:random]]) {
            random = arc4random_uniform(self.foodChoices.count);
        }
        [foodPic setImage:[UIImage imageNamed:[self.foodChoices objectAtIndex:random]]];
    
        [self.alreadyJudgedFood addObject:[NSNumber numberWithInt:random]];
    }
}

-(IBAction)didSwipeRight:(id)sender {
    
    [foodPic isHighlighted];
    if (self.foodChoices.count == self.alreadyJudgedFood.count) {
        [foodPic setImage:[UIImage imageNamed:@"sorry.png"]];
    } else {
        NSMutableArray* likesArray = [[PFUser currentUser] objectForKey:@"likes"];
        if(likesArray == nil) {
            likesArray = [[NSMutableArray alloc] init];
        }
    
        PFObject* caviar = [PFObject objectWithClassName:@"Food"];
        caviar[@"name"] = @"Caviar";
    
        PFObject* like = [PFObject objectWithClassName:@"Like"];
        like[@"food"] = caviar;
    
        [likesArray addObject:like];
        [PFUser currentUser][@"likes"] = likesArray;
    
        [[PFUser currentUser] saveInBackground];
    
        int random = -1;
        while (random == -1 || [self.alreadyJudgedFood containsObject:[NSNumber numberWithInt:random]]) {
            random = arc4random_uniform(self.foodChoices.count);
        }
        [foodPic setImage:[UIImage imageNamed:[self.foodChoices objectAtIndex:random]]];
    
        [self.alreadyJudgedFood addObject:[NSNumber numberWithInt:random]];
    }
}


@end
