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
    
    fileprivate let launcher = InfoMessageLauncher()
    
    
    
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


extension InfoMessageViewController {
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        launcher.showActionSheet()
    }
}
