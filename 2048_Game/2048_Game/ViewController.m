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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateBoard{
    NSString * temp;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            temp = [NSString stringWithFormat:@"%d", game[i][j]];
            labels[i][j].text = temp;
        }
    }
}

-(bool)losingBoard{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 0)
                return false;
            if((j != 3) && (game[i][j] == game[i][j+1]))
                return false;
            if((i != 3) && (j != 3) && (game[i][j] == game[i+1][j+1]))
                return false;
            if((i != 3) && (game[i][j] == game[i+1][j]))
                return false;
            if((i != 3) && (j != 0) && (game[i][j] == game[i+1][j-1]))
                return false;
            if((j != 0) && (game[i][j] == game[i][j-1]))
                return false;
            if((i != 0) && (j != 0) && (game[i][j] == game[i-1][j-1]))
                return false;
            if((i != 0) && (game[i][j] == game[i-1][j]))
                return false;
            if((i != 0) && (j != 3) && (game[i][j] == game[i-1][j+1]))
                return false;
        }
    }
    _upButton.enabled = false;
    _downButton.enabled = false;
    _leftButton.enabled = false;
    _rightButton.enabled = false;
    NSLog(@"You Lose!");
    return true;
}

-(bool)winningBoard{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 2048){
                _upButton.enabled = false;
                _downButton.enabled = false;
                _leftButton.enabled = false;
                _rightButton.enabled = false;
                NSLog(@"You Win!");
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
- (IBAction)startGame:(id)sender {
    [self generate2];
    [self generate2];
    [self updateBoard];
}

- (IBAction)swipeUp:(id)sender {
    if(![self winningBoard] && ![self losingBoard]){
        [self moveUp];
        [self combineUp];
        [self moveUp];
        [self generate2];
        [self updateBoard];
    }
}
- (IBAction)swipeDown:(id)sender {
    if(![self winningBoard] && ![self losingBoard]){
        [self moveDown];
        [self combineDown];
        [self moveDown];
        [self generate2];
        [self updateBoard];
    }
}
- (IBAction)swipeLeft:(id)sender {
    if(![self winningBoard] && ![self losingBoard]){
        [self moveLeft];
        [self combineLeft];
        [self generate2];
        [self updateBoard];
    }
}
- (IBAction)swipeRight:(id)sender {
    if(![self winningBoard] && ![self losingBoard]){
        [self moveRight];
        [self combineRight];
        [self moveRight];
        [self generate2];
        [self updateBoard];
    }
}



@end

