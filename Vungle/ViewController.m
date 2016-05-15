//
//  ViewController.m
//  Vungle
//
//  Created by 周康 on 16/5/8.
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

- (void) vungleSDKwillCloseAdWithViewInfo:(NSDictionary *)viewInfo willPresentProductSheet:(BOOL)willPresentProductSheet {
    if (willPresentProductSheet) {
        //In this case we don't want to resume animations and sound, the user hasn't returned to the app yet
        NSLog(@"The ad presented was tapped and the user is now being shown the App Product Sheet");
        NSLog(@"ViewInfo Dictionary:");
        for(NSString * key in [viewInfo allKeys]) {
            NSLog(@"%@ : %@", key, [[viewInfo objectForKey:key] description]);
        }
    } else {
        //In this case the user has declined to download the advertised application and is now returning fully to the main app
        //Animations / Sound / Gameplay can be resumed now
        NSLog(@"The ad presented was not tapped - the user has returned to the app");
        NSLog(@"ViewInfo Dictionary:");
        for(NSString * key in [viewInfo allKeys]) {
            NSLog(@"%@ : %@", key, [[viewInfo objectForKey:key] description]);
        }
    }
}

- (void)vungleSDKwillCloseProductSheet:(id)productSheet {
    NSLog(@"The user has downloaded an advertised application and is now returning to the main app");
    //This method can be used to resume animations, sound, etc. if a user was presented a product sheet earlier
}


@end
