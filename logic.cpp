#include <cstdlib>
#include <iostream>

using namespace std;

bool winningBoard(int game[][4]){
	for(int i = 0; i < 4; i++){
		for(int j = 0; j < 4; j++){
			if(game[i][j] == 2048)
				return true;
		}
	}
	return false;
}

int main(int argc, char** argv){
	int game[4][4];
	char move;
	for(int i = 0; i < 4; i++){
		for(int j = 0; j < 4; j++){
			game[i][j] = 0;
		}
	}
	
	while(!winningBoard(game)){	
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++){
				cout << game[i][j] << "\t";
			}
				cout << endl;
		}
		cout << endl << endl;
		cout << "Enter move: ";
		cin >> move;
	}

	return 0;
}
