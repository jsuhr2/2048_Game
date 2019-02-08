CFLAGS = -Wall -Wextra -DDEBUG -g -pedantic -std=c++14

all: logic

logic.o: logic.cpp
	g++ $(CFLAGS) logic.cpp -c -o logic.o

logic: logic.o
	g++ $(CFLAGS) logic.o -o logic

clean:
	rm logic.o
	rm logic
