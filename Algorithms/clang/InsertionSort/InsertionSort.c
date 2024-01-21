//
//  InsertionSort.c
//  InsertionSort
//
//  Created by Gabriel Soria Souza on 27/07/21.
//

#include "InsertionSort.h"
#include <stdio.h>
#include <stdlib.h>


void swap(int *xp, int *yp);

void insertion_sort(int s[], int n) {
    int i, j;
    
    for (i = 1; i < n; i++) {
        j = i;
        while ((j > 0) && (s[j] < s[j - 1])) {
            swap(&s[j], &s[j - 1]);
            j = j - 1;
        }
    }
}

void swap(int *xp, int *yp) {
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void new_insertion_sort(int list[], int n) {
    //sort list[0] to list[n-1] in ascending order
    for (int h = 1; h < n; h++) {
        int key = list[h];
        int k = h - 1; //start comparing with previous item
        while (k >= 0 && key < list[k]) {
            list[k + 1] = list[k];
            --k;
        }
        list[k + 1] = key;
    }//end for
}//end func
