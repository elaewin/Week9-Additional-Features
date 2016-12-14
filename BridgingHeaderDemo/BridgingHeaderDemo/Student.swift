//
//  Student.swift
//  BridgingHeaderDemo
//
//  Created by Erica Winberry on 12/14/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class Student: Person {
    
    let studentID: String
    let email: String
    
    init (studentID: String, email: String, firstName: String, lastName: String) {
        
        self.studentID = studentID
        self.email = email
        
        super.init(firstName: firstName, lastName: lastName)
    }
    
    func chewGum() {
        print("Nom nom nom nom nom...")
    }
    
    override func talk() {
        print("\(firstName) says, 'Ooh...magic...!'")
    }
    
}
