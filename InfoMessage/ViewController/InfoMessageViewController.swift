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
    var counter = 0
    var timer: Timer?
    
    
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
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(startAnimate), userInfo: nil, repeats: true)
    }
}


extension InfoMessageViewController {
    
    func startAnimate() {
        counter += 1
        print (counter)
        launcher.setProgress(Float(counter) / 100.0)
        print(Float(counter) / 100.0)
        if counter == 100 {
            timer?.invalidate()
            launcher.handleDismiss()
            counter = 0
        }
    }
}
