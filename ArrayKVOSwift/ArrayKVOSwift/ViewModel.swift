//
//  ViewModel.swift
//  ArrayKVOSwift
//
//  Created by Christopher on 12/10/2017.
//  Copyright © 2017 monwingyeung. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @objc dynamic var names = [String]() // Remember to add a dynamic to enable KVO
    
    private var nameArray: [String] {
        get {
            return self.mutableArrayValue(forKey: "names") as! [String]
        }
        
        set {
            names = newValue
        }
    }
    
    func addName(_ name: String) {
        self.nameArray.append(name)
    }
    
    func addNames(_ names: [String]) {
        self.nameArray.append(contentsOf: names)
    }
    
    func addNamesOnce(_ names: [String]) {
        self.nameArray.insert(contentsOf: names, at: self.nameArray.count)
        
    }
    
    func removeNameAt(_ index: Int) {
        self.nameArray.remove(at: index)
    }
}
