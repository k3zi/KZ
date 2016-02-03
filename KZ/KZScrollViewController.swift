//
//  BareboneViewController.swift
//  Dawgtown
//
//  Created by Kesi Maduka on 7/31/15.
//  Copyright (c) 2015 Storm Edge Apps LLC. All rights reserved.
//

import UIKit

public class KZScrollViewController: KZViewController {
    public var scrollView = UIScrollView()
    public var contentView = UIView()

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }

    public override func setupConstraints() {
        super.setupConstraints()
        
        scrollView.autoPinEdgeToSuperviewEdge(.Left)
        scrollView.autoPinEdgeToSuperviewEdge(.Right)
        scrollView.autoPinEdgeToSuperviewEdge(.Top)
        scrollView.autoPinToBottomLayoutGuideOfViewController(self, withInset: 0)
        
        contentView.autoPinEdgeToSuperviewEdge(.Left)
        contentView.autoPinEdgeToSuperviewEdge(.Top)
        contentView.autoPinEdgeToSuperviewEdge(.Bottom)
        contentView.autoMatchDimension(.Width, toDimension: .Width, ofView: scrollView)
    }
}