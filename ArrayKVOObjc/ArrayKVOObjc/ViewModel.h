//
//  ViewModel.h
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *names;

- (void)addName:(NSString *)name;
- (void)addNames:(NSArray<NSString *>*)names;
- (void)addNamesOnce:(NSArray<NSString *>*)names;
- (void)removeNameAt:(NSUInteger)index;

@end
