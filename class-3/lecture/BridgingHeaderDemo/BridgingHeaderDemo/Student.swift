//
//  Student.swift
//  BridgingHeaderDemo
//
//  Created by Adam Wallraff on 12/14/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

import UIKit

class Student: Person {
    
    let studentID : String
    let email: String
    
    init(studentID: String, email: String, firstName: String, lastName: String) {
        self.studentID = studentID
        self.email = email
        
        super.init(firstName: firstName, lastName: lastName)

    }
    
    func chewGum(){
        print("like nom nom nom nom nom nom.....")
    }
    
    override func talk() {
        print("Like, hello. Like, how you doin? Magic Bruh? My name is \(firstName).")
    }

}
