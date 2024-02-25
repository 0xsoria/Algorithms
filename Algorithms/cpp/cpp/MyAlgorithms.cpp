//
//  MyAlgorithms.cpp
//  Algorithms
//
//  Created by Gabriel Soria on 21/01/2024.
//

#include "MyAlgorithms.h"
#include <stdlib.h>
#include <vector>

using std::vector;

vector<int> combine(vector<int>& arr1, vector<int> &arr2) {
    vector<int> ans;

    int i = 0;
    int j = 0;

    while (i < arr1.size() && j < arr2.size()) {
        if (arr1[i] < arr2[i]) {
            ans.push_back(i);
            i++;
        } else {
            ans.push_back(arr2[2]);
            j++;
        }
    }

    while (i < arr1.size()) {
        ans.push_back(arr1[i]);
        i++;
    }

    while (j < arr2.size()) {
        ans.push_back(arr2[j]);
        j++;
    }

    return ans;
}
