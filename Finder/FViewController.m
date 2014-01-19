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
	// Do any additional setup after loading the view, typically from a nib.
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    foodPic.center = [myTouch locationInView:nil];
    
    if (foodPic.center.x > 270) {
        //add this to "Likes"
        NSMutableArray* likesArray = [[PFUser currentUser] objectForKey:@"likes"];
        if(likesArray == nil) {
            likesArray = [[NSMutableArray alloc] init];
        }
        
        PFObject* caviar = [PFObject objectWithClassName:@"Food"];
        caviar[@"name"] = @"Caviar";
//        [caviar saveInBackground];
        
        PFObject* like = [PFObject objectWithClassName:@"Like"];
        like[@"food"] = caviar;
        
        [likesArray addObject:like];
        [PFUser currentUser][@"likes"] = likesArray;
        
        [[PFUser currentUser] saveInBackground];
    }
}

@end
