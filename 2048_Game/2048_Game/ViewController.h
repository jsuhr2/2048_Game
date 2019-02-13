//
//  ViewController.h
//  2048_Game
//
//  Created by Jasper Suhr on 2/10/19.
//  Copyright © 2019 Jasper Suhr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;

@end

