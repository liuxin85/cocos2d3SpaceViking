//
//  BackgroundScene.m
//  cocos2d3SpaceViking
//
//  Created by liuxin on 14-7-21.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

+ (GameScene *)scene{
    return [[self alloc]init];
}

- (id)init{
    self = [super init];  //1
    if (self!= nil) {       //2
        //3
        
        CCSprite *backgroundImage;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
           backgroundImage = [CCSprite spriteWithImageNamed:@"background.png"];
            
        }else{
            backgroundImage = [CCSprite spriteWithImageNamed:@"backgroundiphone.png"];
        }
        
        CGSize size = self.contentSize;
        //[backgroundImage setPosition:ccp(size.width/2, size.height/2)];  //5
        backgroundImage.position = ccp(size.width/2, size.height/2);
        [self addChild: backgroundImage z:0 name:@"background"];   //6
        
        vikingSprite = [CCSprite spriteWithImageNamed:@"sv_anim_1.png"];
        vikingSprite.position = ccp(size.width/2, size.height*0.17f);
        
        //Add vikingSpirte to  BackgroundScene
        [self addChild: vikingSprite z:1 name: @"vikingSprite"];
      
        
    
        
    }
    return self;     //7
    
}

@end
