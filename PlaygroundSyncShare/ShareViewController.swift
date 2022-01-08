//
//  ShareViewController.swift
//  PlaygroundSync
//
//  Created by A. Zheng (github.com/aheze) on 1/8/22.
//  Copyright © 2022 A. Zheng. All rights reserved.
//
    

import UIKit
import Social
import SwiftUI

@objc(ShareViewController)
class ShareViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: ShareView())
        addChildViewController(hostingController, in: view)
    }
}

extension UIViewController {
    func addChildViewController(_ childViewController: UIViewController, in inView: UIView) {
        /// Add Child View Controller
        addChild(childViewController)
        
        /// Add Child View as Subview
        inView.insertSubview(childViewController.view, at: 0)
        
        /// Configure Child View
        childViewController.view.frame = inView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        /// Notify Child View Controller
        childViewController.didMove(toParent: self)
    }
}
