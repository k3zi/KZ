//
//  DawgUserCell.swift
//
//
//  Created by Kesi Maduka on 8/20/15.
//
//

import UIKit
import PureLayout

class KZTableViewCell: UITableViewCell {
    let topSeperator = UIView()
    let bottomSeperator = UIView()
    
    var didSetupConstraints = false
    var model: Any?
    
    override required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        
        topSeperator.backgroundColor = RGB(239)
        self.contentView.addSubview(topSeperator)
        bottomSeperator.backgroundColor = RGB(239)
        self.contentView.addSubview(bottomSeperator)
        
        self.contentView.bounds.size.height = 99999
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if didSetupConstraints {
            return
        }
        
        bottomSeperator.autoSetDimension(.Height, toSize: (1.0/UIScreen.mainScreen().scale))
        bottomSeperator.autoPinEdgeToSuperviewEdge(.Bottom)
        bottomSeperator.autoPinEdgeToSuperviewEdge(.Left)
        bottomSeperator.autoPinEdgeToSuperviewEdge(.Right)
        
        topSeperator.autoSetDimension(.Height, toSize: (1.0/UIScreen.mainScreen().scale))
        topSeperator.autoPinEdgeToSuperviewEdge(.Top)
        topSeperator.autoPinEdgeToSuperviewEdge(.Left)
        topSeperator.autoPinEdgeToSuperviewEdge(.Right)
        
        didSetupConstraints = true
    }
    
    func getHeight() -> CGFloat {
        self.contentView.bounds.size.height = 99999
        self.setNeedsUpdateConstraints()
        self.updateConstraints()
        
        self.bounds.size.width = UIScreen.mainScreen().bounds.size.width
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let height = self.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        return height + CGFloat(1.0)
    }
    
    func setIndexPath(indexPath: NSIndexPath, last: Bool) {
        if indexPath.row == 0 {
            topSeperator.alpha = 0.0
        } else {
            topSeperator.alpha = 1.0
        }
    }
    
    func setContent(content: Any) {
        model = content
        
        fillInCellData()
    }
    
    func fillInCellData() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
