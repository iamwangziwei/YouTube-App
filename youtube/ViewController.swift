//
//  ViewController.swift
//  youtube
//
//  Created by VV on 2020-12-27.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideo()
    }


}

