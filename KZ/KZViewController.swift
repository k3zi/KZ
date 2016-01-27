//
//  BareboneViewController.swift
//  Dawgtown
//
//  Created by Kesi Maduka on 7/31/15.
//  Copyright (c) 2015 Storm Edge Apps LLC. All rights reserved.
//

import UIKit

public class KZViewController: UIViewController {
    var didSetConstraints = false
    public var isReady = false
    
    var didPresentVC = false
    public var settings = VCSettings()
    
    var timer: NSTimer?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setNeedsUpdateConstraints()

        
        didPresentVC = false
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(15.0, target: self, selector: Selector("fetchData"), userInfo: nil, repeats: true)
        }
    }
    
    override public func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    override public func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        super.presentViewController(viewControllerToPresent, animated: flag, completion: completion)
        didPresentVC = true
    }
    
    override public func updateViewConstraints() {
        if !didSetConstraints {
            setupConstraints()
            didSetConstraints = true
        }
        
        super.updateViewConstraints()
    }

    public func setupConstraints() {

    }
    
    public dynamic func fetchData() {
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}


public struct VCSettings {
    var customTitleView: UIView?
    var title = ""
}