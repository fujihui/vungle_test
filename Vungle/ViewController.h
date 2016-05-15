//
//  ViewController.h
//  Vungle
//
//  Created by Jericho on 16/5/8.
//  Copyright © 2016年 Jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VungleSDK/VungleSDK.h>

@interface ViewController : UIViewController <VungleSDKDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showAdButton;
//@property (weak, nonatomic) IBOutlet UIButton *showAdWithOptionsButton;
//@property (weak, nonatomic) IBOutlet UIButton *showIncentivizedAdButton;
- (IBAction)ShowAd;
//-(IBAction)showAdWithOptions;
@end

