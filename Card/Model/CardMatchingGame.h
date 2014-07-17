//
//  CardMatchingGame.h
//  Card
//
//  Created by Xiaoping Li on 6/23/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:
    (Deck *)deck;

-(void)chooseCardAtIndex: (NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
//readonly means no setter method, so other people cannot set the  score
@property (nonatomic, readonly) NSInteger score;
@end
