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


/*
 Merge two sorted lists A and B as one linked list
 Node is defined as
 struct Node
 {
 int data;
 struct Node *next;
 }
 
 cA = 1 | 3
 cB = 2
 prevA = null | 1
 prevB = null
 
 
 
 
 */

struct Node
{
    int data;
    struct Node *next;
};

Node* MergeLists(Node *headA, Node* headB)
{
    Node *currentA = headA;
    Node *currentB = headB;
    Node *prevA = NULL;
    Node *prevB = NULL;
    
    if (headA == NULL) {
        return headB;
    }
    
    while (currentA != NULL || currentB != NULL) {
        if (currentA != NULL) {
            if (currentB != NULL) {
                if (currentA->data <= currentB->data) {
                    prevA = currentA;
                    currentA = currentA->next;
                } else {
                    Node *nextB = currentB->next;
                    if (prevA == NULL) {
                        currentB->next = headA;
                        headA = currentB;
                    } else {
                        prevA->next = currentB;
                        prevB = currentB;
                        currentB->next = currentA;
                    }
                    currentB = nextB;
                }
            } else {
                break;
            }
        } else {
            if (currentB != NULL) {
                    prevA->next = currentB;
                    prevB = currentB;
                    currentB = currentB->next;
            } else {
                break;
            }
        }
    }
    return(headA);
}


int main(int argc, const char * argv[]) {
    Node headA, a3, a5, a6;
    Node headB, b4, b7;
    
    headA.data = 1;
    headA.next = &a3;
    a3.data = 3;
    a3.next = &a5;
    a5.data = 5;
    a5.next = &a6;
    a6.data = 6;
    a6.next = NULL;
    
    headB.data = 2;
    headB.next = &b4;
    b4.data = 4;
    b4.next = &b7;
    b7.data = 7;
    b7.next = NULL;
    
    MergeLists(&headA, &headB);

    Node a15, b12;
    a15.data = 15;
    a15.next = NULL;
    b12.data = 12;
    b12.next = NULL;
    
    MergeLists(&a15, &b12);

    b4.next = &b7;
    b7.next = NULL;
    
    MergeLists(NULL, &b4);

    return 0;
}
