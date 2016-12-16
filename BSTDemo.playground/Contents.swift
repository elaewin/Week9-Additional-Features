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
            let leftDescription = leftTree.print()
            
            description += "(\(leftDescription)) <- "
        }
        
        description += "\(self.value)"
        
        if let rightTree = self.rightTree {
            let rightDescription = rightTree.print()
            
            description += " -> (\(rightDescription))"
        }
        
        return description
    }


}


var myBinarySearchTree = BST<Int>(10)

myBinarySearchTree.insert(12)
myBinarySearchTree.insert(8)
myBinarySearchTree.insert(5)
myBinarySearchTree.insert(9)
myBinarySearchTree.insert(1)
myBinarySearchTree.insert(6)
myBinarySearchTree.insert(11)
myBinarySearchTree.insert(15)
myBinarySearchTree.insert(13)
myBinarySearchTree.print()












