//
//  ViewModel.m
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (void)addName:(NSString *)name {
    [[self nameArray] addObject:name];
}

- (void)addNames:(NSArray<NSString *>*)names {
    [[self nameArray] addObjectsFromArray:names];
}

- (void)addNamesOnce:(NSArray<NSString *> *)names {
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self nameArray].count, names.count)];
    [[self nameArray] insertObjects:names atIndexes:set];
}

- (void)removeNameAt:(NSUInteger)index {
    if (index >= [self nameArray].count) {
        return;
    }
    
    [[self nameArray] removeObjectAtIndex:index];
}

- (NSMutableArray *)nameArray {
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(names))];
}

- (NSMutableArray *)names {
    if (!_names) {
        _names = [NSMutableArray array];
    }
    
    return _names;
}

@end
