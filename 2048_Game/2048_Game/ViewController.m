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
/*
NSArray *game = @[@[@1, @2, @3, @4],
                  @[@1, @2, @3, @4],
                  @[@1, @2, @3, @4],
                  @[@1, @2, @3, @4],
                ];
*/

float game[4][4];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateBoard{
    
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
    return true;
}

-(bool)winningBoard{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(game[i][j] == 2048)
                return true;
        }
    }
    return false;
}

-(void)generate2{
    srand(time(NULL));
    while(true){
        int i = rand() % 4;
        int j = rand() % 4;
        if(game[i][j] == 0){
            game[i][j] = 2;
            return;
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
    self.view.backgroundColor = [UIColor blueColor];
    [self generate2];
    [self generate2];
    [self updateBoard];
}

- (IBAction)pressUp:(id)sender {
    [self moveUp];
    [self combineUp];
    [self moveUp];
    [self generate2];
    [self updateBoard];
}

- (IBAction)pressLeft:(id)sender {
    [self moveLeft];
    [self combineLeft];
    [self moveLeft];
    [self generate2];
    [self updateBoard];
}

- (IBAction)pressDown:(id)sender {
    [self moveDown];
    [self combineDown];
    [self moveDown];
    [self generate2];
    [self updateBoard];
}

- (IBAction)pressRight:(id)sender {
    [self moveRight];
    [self combineRight];
    [self moveRight];
    [self generate2];
    [self updateBoard];
}

@end

