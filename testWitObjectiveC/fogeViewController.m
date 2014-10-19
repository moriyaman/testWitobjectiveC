//
//  fogeViewController.m
//  testWitObjectiveC
//
//  Created by Yuki Moriyama on 2014/10/19.
//  Copyright (c) 2014年 yuki.moriyama. All rights reserved.
//

#import "fogeViewController.h"
#import <Wit/Wit.h>

@implementation fogeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set the WitDelegate object
    [Wit sharedInstance].delegate = self;
    
    // create the button
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat w = 100;
    CGRect rect = CGRectMake(screen.size.width/2 - w/2, 60, w, 100);
    
    WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
    [self.view addSubview:witButton];
    
    // create the label
    _labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screen.size.width, 50)];
    _labelView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labelView];
}


- (void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e {
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    
    _labelView.text = [NSString stringWithFormat:@"intent = %@", intent];
    
    [self.view addSubview:_labelView];
}

@end
