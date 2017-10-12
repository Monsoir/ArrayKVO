//
//  ViewModel2.m
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import "ViewModel2.h"

@implementation ViewModel2

- (void)insertObject:(NSString *)object inNamesAtIndex:(NSUInteger)index {
    [self.names insertObject:object atIndex:index];
}

- (void)insertNames:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    [self.names insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromNamesAtIndex:(NSUInteger)index {
    [self.names removeObjectAtIndex:index];
}

- (void)removeNamesAtIndexes:(NSIndexSet *)indexes {
    [self.names removeObjectsAtIndexes:indexes];
}

- (NSMutableArray *)names {
    if (!_names) {
        _names = [NSMutableArray array];
    }
    
    return _names;
}

@end
