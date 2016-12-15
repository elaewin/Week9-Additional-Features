//
//  OtherViewController.swift
//  BridgingHeaderDemo
//
//  Created by Adam Wallraff on 12/14/16.
//  Copyright © 2016 Adam Wallraff. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myMagic = Magic()
        
        myMagic.showMeMagic()
        
        Magic.sayHiToShai()
        
        
    }


}
