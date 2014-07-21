//
//  BackgroundScene.h
//  cocos2d3SpaceViking
//
//  Created by liuxin on 14-7-21.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystickSkinnedBase.h"

@interface GameScene : CCScene{
    CCSprite *vikingSprite;
    
    SneakyJoystick *leftJoystick;
    SneakyButton *jumpButton;
    SneakyButton *attackButton;
    
}
+ (GameScene *)scene;
- (id)init;
@end
