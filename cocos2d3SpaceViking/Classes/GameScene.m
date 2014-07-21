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
        self.userInteractionEnabled = TRUE;
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
        
        [self initJoystickAndButtons];
       
      
        
    
        
    }
    return self;     //7
    
}
- (void)initJoystickAndButtons{
    CGSize screenSize = self.contentSize;
    CGRect joystickBaseDimensions = CGRectMake(0, 0, 128.0f, 128.0f);
    CGRect jumpButtonDimensions = CGRectMake(0, 0, 64.0f, 64.0f);
    CGRect attackButtonDimensions = CGRectMake(0, 0, 64.0f, 64.0f);
    
    CGPoint joystickBasePosition;
    CGPoint jumpButtonPosition;
    CGPoint attackButtonPosition;
    
    CCLOG(@"Positionging Joystick and Buttons for ipad");
    
    joystickBasePosition = ccp(screenSize.width*0.0625f, screenSize.height*0.052f);
    jumpButtonPosition = ccp(screenSize.width*0.946f, screenSize.height*0.052f);
    attackButtonPosition = ccp(screenSize.width* 0.947f, screenSize.height*0.169f);
    
    SneakyJoystickSkinnedBase *joystickBase = [[SneakyJoystickSkinnedBase alloc]init];
    joystickBase.position = joystickBasePosition;
    joystickBase.backgroundSprite = [CCSprite spriteWithImageNamed:@"dpadDown.png"];
    joystickBase.thumbSprite = [CCSprite spriteWithImageNamed:@"joystickDown.png"];
    joystickBase.joystick = [[SneakyJoystick alloc]initWithRect: joystickBaseDimensions]; //9
    
    leftJoystick = joystickBase.joystick;   //10
    [self addChild: joystickBase];
    
    SneakyButtonSkinnedBase *jumpButtonBase = [[SneakyButtonSkinnedBase alloc]init];
    jumpButtonBase.position = jumpButtonPosition;  //13
    jumpButtonBase.defaultSprite = [CCSprite spriteWithImageNamed:@"jumpUp.png"];
    jumpButtonBase.activatedSprite = [CCSprite spriteWithImageNamed:@"jumpDown.png"];
    jumpButtonBase.pressSprite = [CCSprite spriteWithImageNamed:@"jumpDown.png"];
    jumpButtonBase.button = [[SneakyButton alloc]initWithRect: jumpButtonDimensions];
    
    jumpButton = jumpButtonBase.button;
    jumpButton.isToggleable = NO;
    [self addChild: jumpButtonBase];
    
   
    SneakyButtonSkinnedBase *attackButtonBase = [[SneakyButtonSkinnedBase alloc]init];
    attackButtonBase.position = attackButtonPosition;  //13
    attackButtonBase.defaultSprite = [CCSprite spriteWithImageNamed:@"handUp.png"];
    attackButtonBase.activatedSprite = [CCSprite spriteWithImageNamed:@"handDown.png"];
    attackButtonBase.pressSprite = [CCSprite spriteWithImageNamed:@"handDown.png"];
    attackButtonBase.button = [[SneakyButton alloc]initWithRect: attackButtonDimensions];
    
    attackButton = attackButtonBase.button;
    attackButton.isToggleable = NO;
    [self addChild: attackButtonBase];
    
    
}
- (void)applyJoystick: (SneakyJoystick *)aJoystick toNode:(CCNode *)tempNode
         forTimeDelta: (float)deltaTime
{
    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 1024.0f);
    CGPoint newPostion = ccp(tempNode.position.x + scaledVelocity.x * deltaTime,
                             tempNode.position.y + scaledVelocity.y * deltaTime);
    [tempNode setPosition: newPostion];
    
    if (jumpButton.active == YES) {
        CCLOG(@"Jump button is pressed. ");
    }
    if (attackButton.active == YES) {
        CCLOG(@"Attack button is pressed.");
    }
}
#pragma mark -
#pragma mark Update Method
- (void)update:(CCTime)delta
{
    [self applyJoystick: leftJoystick toNode:vikingSprite forTimeDelta:delta];
}
@end
