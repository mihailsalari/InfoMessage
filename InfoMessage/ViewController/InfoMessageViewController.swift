//
//  InfoMessageViewController.swift
//  InfoMessage
//
//  Created by Mihail Șalari on 12/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class InfoMessageViewController: UIViewController {

    // MARK: - Properties

    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - @IBAction's

extension InfoMessageViewController {
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        let launcher = InfoMessageLauncher()
        launcher.autoAnimation()
    }
}
