//
//  InfoMessageLauncher.swift
//  InfoMessage
//
//  Created by Mihail Șalari on 12/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class InfoMessageLauncher: NSObject {
    
    // MARK: - Properties
    
    fileprivate lazy var window: UIWindow = {
        guard let window = UIApplication.shared.keyWindow else { return UIWindow() }
        
        return window
    }()
    
    fileprivate lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.alpha = 0.0
        view.frame = self.window.frame
        
        return view
    }()
    
    fileprivate let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.textColor = UIColor.darkSkyBlue
        button.backgroundColor = UIColor.rgb(red: 245.0, green: 245.0, blue: 247.0, alpha: 1.0)
        button.layer.cornerRadius = 4.0
        
        return button
    }()
    
    
    fileprivate lazy var centerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.alpha = 0.0
        
        return view
    }()
    
    fileprivate lazy var progressContainerView: CircularProgressView = {
        let view = CircularProgressView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 118 / 2
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.rgb(red: 245.0, green: 245.0, blue: 247.0, alpha: 1.0)
        label.text = "Recognition"
        
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init() {
        super.init()
    }
}


// MARK: - Show&Hide View

extension InfoMessageLauncher {
    
    func showActionSheet() {
        /// 1
        window.addSubview(blackView)
        window.addSubview(cancelButton)
        window.addSubview(centerContainerView)
        
        ///
        centerContainerView.addSubview(progressContainerView)
        centerContainerView.addSubview(nameLabel)
        
        ///
        centerContainerView.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: progressContainerView) /// 158 x 158
        centerContainerView.addConstraintsWithFormat("H:|[v0]|", views: nameLabel) /// 158 x 158
        
        centerContainerView.addConstraintsWithFormat("V:|[v0][v1(55)]|", views: progressContainerView, nameLabel)
        
        /// adding constraints in show
        if let progressLabel = self.progressContainerView.textLabel {
            progressContainerView.addConstraintsWithFormat("H:|-10-[v0]-10-|", views: progressLabel)
            progressContainerView.addConstraintsWithFormat("V:|-10-[v0]-10-|", views: progressLabel)
        }
        
        ///
        centerContainerView.frame = CGRect(x: 0, y: 0, width: 158, height: 173)
        centerContainerView.center = window.center
        
        /// 2
        cancelButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        /// 3
        let margin: CGFloat = 7.0
        let contHeight: CGFloat = 60.0
        let contY = (window.frame.height - contHeight) - margin
        
        /// 4
        self.cancelButton.frame = CGRect(x: margin, y: window.frame.height, width: window.frame.width - (margin * 2), height: contHeight)
        
        
        /// 5
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
            self.blackView.alpha = 1.0
            self.centerContainerView.alpha = 1.0
            self.progressContainerView.alpha = 1.0
            self.nameLabel.alpha = 1.0
            
            
            self.cancelButton.frame = CGRect(x: margin, y: contY, width: self.cancelButton.frame.width, height: self.cancelButton.frame.height)
            }, completion: nil)
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.blackView.alpha = 0.0
            self.centerContainerView.alpha = 0.0
            self.progressContainerView.alpha = 0.0
            self.nameLabel.alpha = 0.0
            self.cancelButton.frame = CGRect(x: 7, y: self.window.frame.height, width: self.cancelButton.frame.width, height: self.cancelButton.frame.height)
        }
    }
}



extension InfoMessageLauncher {
    
    func setProgress(_ progress: CGFloat) {
    }
}
