//  ViewController.m
//  2048_Game
//
//  Created by Jasper Suhr on 2/10/19.
//  Copyright © 2019 Jasper Suhr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int game[4][4];

UILabel *labels[4][4];

UIView *views[4][4];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_upSwipe setDirection:UISwipeGestureRecognizerDirectionUp];
    [_downSwipe setDirection:UISwipeGestureRecognizerDirectionDown];
    [_leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            game[i][j] = 0;
        }
    }
    labels[0][0] = [self.view viewWithTag:1];
    labels[0][1] = [self.view viewWithTag:2];
    labels[0][2] = [self.view viewWithTag:3];
    labels[0][3] = [self.view viewWithTag:4];
    labels[1][0] = [self.view viewWithTag:5];
    labels[1][1] = [self.view viewWithTag:6];
    labels[1][2] = [self.view viewWithTag:7];
    labels[1][3] = [self.view viewWithTag:8];
    labels[2][0] = [self.view viewWithTag:9];
    labels[2][1] = [self.view viewWithTag:10];
    labels[2][2] = [self.view viewWithTag:11];
    labels[2][3] = [self.view viewWithTag:12];
    labels[3][0] = [self.view viewWithTag:13];
    labels[3][1] = [self.view viewWithTag:14];
    labels[3][2] = [self.view viewWithTag:15];
    labels[3][3] = [self.view viewWithTag:16];
    
    views[0][0] = [self.view viewWithTag:100];
    views[0][1] = [self.view viewWithTag:101];
    views[0][2] = [self.view viewWithTag:102];
    views[0][3] = [self.view viewWithTag:103];
    views[1][0] = [self.view viewWithTag:104];
    views[1][1] = [self.view viewWithTag:105];
    views[1][2] = [self.view viewWithTag:106];
    views[1][3] = [self.view viewWithTag:107];
    views[2][0] = [self.view viewWithTag:108];
    views[2][1] = [self.view viewWithTag:109];
    views[2][2] = [self.view viewWithTag:110];
    views[2][3] = [self.view viewWithTag:111];
    views[3][0] = [self.view viewWithTag:112];
    views[3][1] = [self.view viewWithTag:113];
    views[3][2] = [self.view viewWithTag:114];
    views[3][3] = [self.view viewWithTag:115];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateBoard{
//  NSString * temp;
         for(int i = 0; i < 4; i++){
            for(int j = 0; j < 4; j++){
               if(game[i][j] != 0){
//                 temp = [NSString stringWithFormat:@"%d", game[i][j]];
//                  labels[i][j].text = temp;
                    if(game[i][j] == 2){
                        views[i][j].backgroundColor = [UIColor blackColor];
                    } else if(game[i][j] == 4){
                        views[i][j].backgroundColor = [UIColor grayColor];
                    } else if(game[i][j] == 8){
                        views[i][j].backgroundColor = [UIColor brownColor];
                    } else if(game[i][j] == 16){
                        views[i][j].backgroundColor = [UIColor orangeColor];
                    } else if(game[i][j] == 32){
                        views[i][j].backgroundColor = [UIColor redColor];
                    } else if(game[i][j] == 64){
                        views[i][j].backgroundColor = [UIColor magentaColor];
                    } else if(game[i][j] == 128){
                        views[i][j].backgroundColor = [UIColor purpleColor];
                    } else if(game[i][j] == 256){
                        views[i][j].backgroundColor = [UIColor cyanColor];
                    } else if(game[i][j] == 512){
                        views[i][j].backgroundColor = [UIColor blueColor];
                    } else if(game[i][j] == 1024){
                        views[i][j].backgroundColor = [UIColor greenColor];
                    } else if(game[i][j] == 2048){
                        views[i][j].backgroundColor = [UIColor yellowColor];
                    }
                }
                if(game[i][j] == 0){
//                  labels[i][j].text = @"";
                    views[i][j].backgroundColor = [UIColor whiteColor];
                }
            }
    }
    bool done = [self winningBoard];
    done = [self losingBoard];
}

-(bool)losingBoard{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 0)
                return false;
            if((j != 3) && (game[i][j] == game[i][j+1]))
                return false;
            if((i != 3) && (game[i][j] == game[i+1][j]))
                return false;
            if((j != 0) && (game[i][j] == game[i][j-1]))
                return false;
            if((i != 0) && (game[i][j] == game[i-1][j]))
                return false;
        }
    }
    _upSwipe.enabled = false;
    _downSwipe.enabled = false;
    _leftSwipe.enabled = false;
    _rightSwipe.enabled = false;
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"You Lose!"
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self dismissViewControllerAnimated:YES completion:nil];
                             [self start];
                         }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    return true;
}

-(bool)winningBoard{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 2048){
                _upSwipe.enabled = false;
                _downSwipe.enabled = false;
                _leftSwipe.enabled = false;
                _rightSwipe.enabled = false;
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"You Win!"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* ok = [UIAlertAction
                                     actionWithTitle:@"OK"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action)
                                     {
                                         [self dismissViewControllerAnimated:YES completion:nil];
                                     }];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
                return true;
            }
        }
    }
    return false;
}

-(void)generate2{
    bool hasZero = false;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 0){
                hasZero = true;
            }
        }
    }
    srand((unsigned int)time(NULL));
    while(hasZero){
        int i = rand() % 4;
        int j = rand() % 4;
        if(game[i][j] == 0){
            game[i][j] = 2;
            break;
        }
    }
}

-(void)moveUp{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(!game[j][i]){
                for(int k = j+1; k < 4; k++){
                    if(game[k][i]){
                        game[j][i] = game[k][i];
                        game[k][i] = 0;
                        break;
                    }
                }
            }
        }
    }
}
-(void)moveLeft{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(!game[i][j]){
                for(int k = j+1; k < 4; k++){
                    if(game[i][k]){
                        game[i][j] = game[i][k];
                        game[i][k] = 0;
                        break;
                    }
                }
            }
        }
    }
}
-(void)moveDown{
    for(int i = 0; i < 4; i++){
        for(int j = 3; j >= 0; j--){
            if(!game[j][i]){
                for(int k = j-1; k >= 0; k--){
                    if(game[k][i]){
                        game[j][i] = game[k][i];
                        game[k][i] = 0;
                        break;
                    }
                }
            }
        }
    }
}
-(void)moveRight{
    for(int i = 0; i < 4; i++){
        for(int j = 3; j >= 0; j--){
            if(!game[i][j]){
                for(int k = j-1; k >= 0; k--){
                    if(game[i][k]){
                        game[i][j] = game[i][k];
                        game[i][k] = 0;
                        break;
                    }
                }
            }
        }
    }
}

-(void)combineUp{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 3; j++){
            if(game[j][i] && game[j][i] == game[j+1][i]){
                game[j][i] += game[j+1][i];
                game[j+1][i] = 0;
            }
        }
    }
}
-(void)combineLeft{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 3; j++){
            if(game[i][j] && game[i][j] == game[i][j+1]){
                game[i][j] += game[i][j+1];
                game[i][j+1] = 0;
            }
        }
    }
}
-(void)combineDown{
    for(int i = 0; i < 4; i++){
        for(int j = 3; j > 0; j--){
            if(game[j][i] && game[j][i] == game[j-1][i]){
                game[j][i] += game[j-1][i];
                game[j-1][i] = 0;
            }
        }
    }
}
-(void)combineRight{
    for(int i = 0; i < 4; i++){
        for(int j = 3; j > 0; j--){
            if(game[i][j] && game[i][j] == game[i][j-1]){
                game[i][j] += game[i][j-1];
                game[i][j-1] = 0;
            }
        }
    }
}
- (void)start{
    _upSwipe.enabled = true;
    _downSwipe.enabled = true;
    _leftSwipe.enabled = true;
    _rightSwipe.enabled = true;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            game[i][j] = 0;
        }
    }
    [self generate2];
    [self generate2];
    [self updateBoard];
}
- (IBAction)startGame:(id)sender {
    _upSwipe.enabled = true;
    _downSwipe.enabled = true;
    _leftSwipe.enabled = true;
    _rightSwipe.enabled = true;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            game[i][j] = 0;
        }
    }
    [self generate2];
    [self generate2];
    [self updateBoard];
}

- (IBAction)swipeUp:(id)sender {
    [self moveUp];
    [self combineUp];
    [self moveUp];
    [self generate2];
    [self updateBoard];
}
- (IBAction)swipeDown:(id)sender {
    [self moveDown];
    [self combineDown];
    [self moveDown];
    [self generate2];
    [self updateBoard];
}
- (IBAction)swipeLeft:(id)sender {
    [self moveLeft];
    [self combineLeft];
    [self generate2];
    [self updateBoard];
}
- (IBAction)swipeRight:(id)sender {
    [self moveRight];
    [self combineRight];
    [self moveRight];
    [self generate2];
    [self updateBoard];
}



@end

