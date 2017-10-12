//
//  Method1ViewController.swift
//  ArrayKVOSwift
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

import UIKit

class Method1ViewController: UIViewController {
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        viewModel.addObserver(self, forKeyPath: #keyPath(ViewModel.names), options: [.new, .old], context: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Add a name:")
        viewModel.addName("Christina")
        
        print("Add many names:")
        viewModel.addNames(["Alice", "Victoria", "Catherine"])
        
        print("Add many names once:")
        viewModel.addNamesOnce(["Veronica", "Rebecca", "Alexandra"])
        
        print("Remove a name:")
        viewModel.removeNameAt(2)
        
        print(viewModel.names)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        viewModel.removeObserver(self, forKeyPath: #keyPath(ViewModel.names), context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let c = change else { return }
        
        if (keyPath! == #keyPath(ViewModel.names)) {
            let kind = c[NSKeyValueChangeKey.kindKey]
            let newNames = c[NSKeyValueChangeKey.newKey]
            let oldNames = c[NSKeyValueChangeKey.oldKey]
            let changedIndexSet = c[NSKeyValueChangeKey.indexesKey]
            
            print("kind: \(String(describing: kind))\nnewNames: \(String(describing: newNames))\noldNames: \(String(describing: oldNames))\nchangedIndexSet: \(String(describing: changedIndexSet))")
        }
    }

}
