//
//  WelcomeViewController.swift
//  ShapovalovAV_HW2.4
//
//  Created by Arthur on 31.08.2020.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var helloUserLabel: UILabel!
    var name: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        helloUserLabel.text = name
    }
}
