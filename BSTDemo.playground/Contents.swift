//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class BST<T: Comparable> {
    // T represents the data, must conform to Comparable protocol.
    
    let value: T
    
    var leftTree: BST?
    var rightTree: BST?
    
    // value is a let, so need to initialize (underscore allows omitting of param name.)
    init(_ value: T) {
        self.value = value
    }
    
    func insert(_ newValue: T) {
        
        if newValue < self.value {
            if let leftTree = self.leftTree {
                leftTree.insert(newValue)
            } else {
                self.leftTree = BST(newValue)
            }
        }
        
        if newValue > self.value {
            if let rightTree = self.rightTree {
                rightTree.insert(newValue)
            } else {
                self.rightTree = BST(newValue)
            }
        }
    }

    func print() -> String {
        
        var description = ""
        
        if let leftTree = self.leftTree {
            // do some stuff
        }
        
        if let rightTree = self.rightTree {
            // so some stuff
        }
    }


}














