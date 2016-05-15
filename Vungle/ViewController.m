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


#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
//    VungleSDK* sdk = [VungleSDK sharedSDK];
//    NSError *error;
//    [sdk playAd:self error:&error];
    
}

#pragma mark - UIViewController Methods

- (IBAction)ShowAd {
    NSLog(@"Now we are going to show AD");
    // Play a Vungle ad (with default options)
    
    VungleSDK* sdk = [VungleSDK sharedSDK];
    NSError *error;
    [sdk playAd:self error:&error];
    if (error) {
        NSLog(@"Error encountered playing ad: %@", error);
    }
    [self enableAdButtons:YES];
}

- (void) enableAdButtons:(BOOL)enabled {
    _showAdButton.enabled = enabled;
}


@end
