//
//  Method2ViewController.m
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import "Method2ViewController.h"
#import "ViewModel2.h"

@interface Method2ViewController ()

@property (nonatomic, strong) ViewModel2 *viewModel;

@end

@implementation Method2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.viewModel addObserver:self forKeyPath:@"names" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"Add a name:");
    [self.viewModel insertObject:@"Christina" inNamesAtIndex:0];
    
    NSLog(@"Add many names:");
    NSArray *elements = @[@"Alice", @"Victoria", @"Catherine"];
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.viewModel.names.count, elements.count)];
    [self.viewModel insertNames:elements atIndexes:set];
    
    NSLog(@"Remove a name:");
    [self.viewModel removeObjectFromNamesAtIndex:2];
    
    NSLog(@"%@", self.viewModel.names);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"names"]) {
        NSNumber *kind = change[NSKeyValueChangeKindKey];
        NSArray *newNames = change[NSKeyValueChangeNewKey];
        NSArray *oldNames = change[NSKeyValueChangeOldKey];
        NSIndexSet *changedIndexSet = change[NSKeyValueChangeIndexesKey];
        
        NSLog(@"kind: %@\nnewNames: %@\noldNames: %@, changedIndexSet: %@", kind, newNames, oldNames, changedIndexSet);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.viewModel removeObserver:self forKeyPath:@"names" context:nil];
}

- (ViewModel2 *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ViewModel2 alloc] init];
    }
    
    return _viewModel;
}

@end
