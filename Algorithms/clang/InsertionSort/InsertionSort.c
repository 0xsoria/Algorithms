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
