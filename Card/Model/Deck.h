//
//  Deck.h
//  Card
//
//  Created by Xiaoping Li on 6/18/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
