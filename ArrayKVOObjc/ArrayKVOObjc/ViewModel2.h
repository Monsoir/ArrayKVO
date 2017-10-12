//
//  ViewModel2.h
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel2 : NSObject

@property (nonatomic, strong) NSMutableArray *names;

- (void)insertObject:(NSString *)object inNamesAtIndex:(NSUInteger)index;
- (void)insertNames:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromNamesAtIndex:(NSUInteger)index;
- (void)removeNamesAtIndexes:(NSIndexSet *)indexes;


@end
