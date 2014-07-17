//
//  Card.m
//  Card
//
//  Created by Xiaoping Li on 6/17/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import "Card.h"

@interface Card()


@end

@implementation Card


// match is used for test is there any cards in othercards is equal to this card.

- (int)match:(NSArray *)othercards
{
    int score = 0;
    
    for (Card *card in othercards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end
