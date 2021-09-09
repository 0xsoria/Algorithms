//
//  InsertSortCPP.m
//  SortingAlgorithms
//
//  Created by Gabriel Sória Souza on 14/06/21.
//

#import "InsertSortCPP.h"
#import "InsertSortCPP.hpp"
#import <vector>

using namespace std;

@interface InsertSortCPP ()
@property NSArray<NSNumber *> *content;
@end

@implementation InsertSortCPP

- (instancetype)initArrayWithValues:(NSArray<NSNumber *> *)array {
    self = [super init];
    if (self) {
        _content = array;
    }
    return self;
}

- (NSArray *)insertSort {
    
    vector<int> cppArray;
    
    int count = [self.content count];
    for (int index = 0; index < count; index++) {
        int number = [[self.content objectAtIndex:index] intValue];
        cppArray.push_back(number);
    }
    
    vector<int> sorted = insertSort(cppArray);
    NSMutableArray *output = [NSMutableArray new];
    
    for (int index = 0; index < sorted.size(); index++) {
        int item = sorted[index];
        NSNumber *value = [NSNumber numberWithInt:item];
        [output addObject:value];
    }

    return output;
}

@end
