//
//  ViewController.m
//  Card
//
//  Created by Xiaoping Li on 6/17/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic)int flipCount;

@end

@implementation ViewController

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"flip :%d",self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}
            
- (IBAction)cardReverse:(UIButton*)sender {
    if ([sender.currentTitle length]){
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];  //default is use normal state
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
