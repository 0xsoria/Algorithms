//
//  InsertSortOBJC.m
//  SortingAlgorithms
//
//  Created by Gabriel Sória Souza on 13/06/21.
//

#import "InsertSortOBJC.h"

@interface InsertSortOBJC ()
@property NSArray<NSNumber *> *content;
@end

@implementation InsertSortOBJC

- (instancetype)initArrayWithValues:(NSArray<NSNumber *> *)array {
    self = [super init];
    if (self) {
        _content = array;
    }
    return self;
}

- (NSArray *)insertSort {
    if (self.content.count == 0) {
        return self.content;
    }
    
    NSMutableArray<NSNumber *> *mutableCopy = [self.content mutableCopy];

    for (int index = 0; index < mutableCopy.count; index++) {
        
        int key = [[mutableCopy objectAtIndex:index] intValue];
        int secondaryIndex = index;
        
        while (secondaryIndex > -1) {
            int secondayItem = [[mutableCopy objectAtIndex:secondaryIndex] intValue];
            if (key < secondayItem) {
                [mutableCopy removeObjectAtIndex:secondaryIndex + 1];
                [mutableCopy insertObject:[NSNumber numberWithInt:key] atIndex:secondaryIndex];
            }
            secondaryIndex -= 1;
        }
        
    }
    return mutableCopy;
}

@end
