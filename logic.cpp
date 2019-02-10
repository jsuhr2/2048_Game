#include <cstdlib>
#include <iostream>

using namespace std;

int game[4][4];

bool losingBoard(){
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

bool winningBoard(){
	for(int i = 0; i < 4; i++){
		for(int j = 0; j < 4; j++){
			if(game[i][j] == 2048)
				return true;
		}
	}
	return false;
}

void generate2(){
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

void moveTiles(char in){
	switch(in){
		case'w':
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
			break;
		case 's':
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
			break;
		case 'a':
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
			break;
		case 'd':
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
			break;
	}
}

void combineTiles(char in){
	switch(in){
		case'w':
			for(int i = 0; i < 4; i++){
				for(int j = 0; j < 3; j++){
					if(game[j][i] && game[j][i] == game[j+1][i]){
						game[j][i] += game[j+1][i];
						game[j+1][i] = 0;
					}
				}
			}
			break;
		case 's':
			for(int i = 0; i < 4; i++){
				for(int j = 3; j > 0; j--){
					if(game[j][i] && game[j][i] == game[j-1][i]){
						game[j][i] += game[j-1][i];
						game[j-1][i] = 0;
					}
				}
			}
			break;
		case 'a':
			for(int i = 0; i < 4; i++){
				for(int j = 0; j < 3; j++){
					if(game[i][j] && game[i][j] == game[i][j+1]){
						game[i][j] += game[i][j+1];
						game[i][j+1] = 0;
					}
				}
			}
			break;
		case 'd':
			for(int i = 0; i < 4; i++){
				for(int j = 3; j > 0; j--){
					if(game[i][j] && game[i][j] == game[i][j-1]){
						game[i][j] += game[i][j-1];
						game[i][j-1] = 0;
					}
				}
			}
			break;
	}
}

int main(int argc, char** argv){
	char move;
	for(int i = 0; i < 4; i++){
		for(int j = 0; j < 4; j++){
			game[i][j] = 0;
		}
	}
	generate2();
	generate2();
	while(!winningBoard() && !losingBoard()){	
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++){
				cout << game[i][j] << "\t";
			}
				cout << endl;
		}
		cout << endl << endl;
		cout << "Enter move: ";
		cin >> move;
		cout << endl;
		moveTiles(move);
		combineTiles(move);
		moveTiles(move);
		cout << endl << endl;
		generate2();
	}
	
	if(losingBoard()){
		cout << "You lost. Thanks for playing!" << endl;
	} else if(winningBoard()){
		cout << "You won. Thanks for playing!" << endl;
	}

	return 0;
}
