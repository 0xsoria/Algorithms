//
//  InsertSortCPP.cpp
//  SortingAlgorithms
//
//  Created by Gabriel Sória Souza on 13/06/21.
//

#include "InsertSortCPP.hpp"
#include <iostream>
#include <vector>

vector<int> insertSort(vector<int> content) {
    if (content.size() == 0) {
        return content;
    }

    vector<int> output = content;

    for (int index = 0; index < output.size(); index++) {
        int key = output[index];
        int secondaryIndex = index;

        while (secondaryIndex > -1) {
            if (key < output[secondaryIndex]) {
                output.erase(output.begin() + secondaryIndex + 1);
                output.insert(output.begin() + secondaryIndex, key);
            }
            secondaryIndex -= 1;
        }
    }

    return output;
}
