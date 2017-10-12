//
//  Method1ViewController.m
//  ArrayKVOObjc
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

#import "Method1ViewController.h"
#import "ViewModel.h"

@interface Method1ViewController ()

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation Method1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.viewModel addObserver:self forKeyPath:@"names" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    NSLog(@"Add a name:");
    [self.viewModel addName:@"Christina"];
    
    NSLog(@"Add many names:");
    NSArray *elements = @[@"Alice", @"Victoria", @"Catherine"];
    [self.viewModel addNames:elements];
    
    NSLog(@"Add many names once:");
    NSArray *elements2 = @[@"Veronica", @"Rebecca", @"Alexandra"];
    [self.viewModel addNamesOnce:elements2];
    
    NSLog(@"Remove a name:");
    [self.viewModel removeNameAt:2];
    
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

- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
