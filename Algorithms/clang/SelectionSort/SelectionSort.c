//
//  SelectionSort.c
//  SelectionSort
//
//  Created by Gabriel Soria Souza on 30/07/21.
//

#include "SelectionSort.h"

void selectionSort(int list[], int lower, int higher) {
    //sort list[lower] to list[higher] in ascending order
    int getSmallest(int list[], int lower, int higher);
    void myswap(int list[], int i, int j);
    for (int h = lower; h < higher; h++) {
        int s = getSmallest(list, h, higher);
        myswap(list, h, s);
    }
}

int getSmallest(int list[], int lower, int higher) {
    //return location pf smallest from list[lower..higher]
    int small = lower;
    for (int h = lower + 1; h <= higher; h++)
        if (list[h] < list[small]) small = h;
    return small;
}

void myswap(int list[], int i, int j) {
    //swap elements list[i] and list[j]
    int hold = list[i];
    list[i] = list[j];
    list[j] = hold;
}
