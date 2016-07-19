//
//  main.cpp
//  challenge
//
//  Created by Alexey Dmitriyev on 7/14/16.
//  Copyright © 2016 Alexey Dmitriyev. All rights reserved.
//


/* Sample code to read in test cases:
#include <iostream>
#include <fstream>
using namespace std;
int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        // Do something with the line
    }
    return 0;
} */


#include <iostream>
#include <fstream>
#include <array>
#include <sstream>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::ifstream stream(argv[1]);
    std::string line;
    std::string answer_line;
    while (getline(stream, line)) {
        std::istringstream input_line(line);
        std::string left_text;
        std::array<std::string, 3> left;
        input_line.getline(left_text, 100, ';')
        std::array<int, 3> sequence;

        
        std::cout << answer_line;
    }
    return 0;
}
