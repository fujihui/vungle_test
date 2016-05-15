//
//  ViewController.m
//  Vungle
//
//  Created by Jericho on 16/5/8.
//  Copyright © 2016年 Jericho. All rights reserved.
//

#import "ViewController.h"
#import <VungleSDK/VungleSDK.h>


@interface ViewController ()

@end

@implementation ViewController

- (IBAction)ShowAd {
    NSLog(@"Now we are going to show AD");
    // Play a Vungle ad (with default options)
    
        VungleSDK* sdk = [VungleSDK sharedSDK];
        NSError *error;
        [sdk playAd:self error:&error];
        if (error) {
            NSLog(@"Error encountered playing ad: %@", error);
        }
}

- (void) enableAdButtons:(BOOL)enabled {
    _showAdButton.enabled = enabled;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set VungleSDK Delegate
    [[VungleSDK sharedSDK] setDelegate:self];
    
    //We might have cached an ad before we reached this ViewController, or might have one cached from a previous launch
    if ([[VungleSDK sharedSDK] isAdPlayable]) {
        [self enableAdButtons:YES];
    }
    
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)dealloc
{
    [[VungleSDK sharedSDK] setDelegate:nil];
}

#pragma mark - VungleSDK Delegate

- (void)vungleSDKAdPlayableChanged:(BOOL)isAdPlayable {
    if (isAdPlayable) {
        NSLog(@"An ad is available for playback");
        if (!_showAdButton.enabled ) {
            [self enableAdButtons:YES];
        }
    } else {
        NSLog(@"No ads currently available for playback");
        [self enableAdButtons:NO];
    }
}

- (void)vungleSDKwillShowAd {
    NSLog(@"An ad is about to be played!");
    //Use this delegate method to pause animations, sound, etc.
}

@end
