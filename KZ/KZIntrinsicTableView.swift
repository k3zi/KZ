//
//  IntrinsicTableView.swift
//  Dawgtown
//
//  Created by Kesi Maduka on 1/7/16.
//  Copyright © 2016 Storm Edge Apps LLC. All rights reserved.
//

import UIKit

class KZIntrinsicTableView: UITableView {

    override func intrinsicContentSize() -> CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: self.contentSize.height)
    }

    override func endUpdates() {
        super.endUpdates()
        self.invalidateIntrinsicContentSize()
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
    override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        super.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
    
    override func reloadSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        super.reloadSections(sections, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
    
    override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        super.insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
    
    override func insertSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        super.insertSections(sections, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
    
    override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        super.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
    
    override func deleteSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        super.deleteSections(sections, withRowAnimation: animation)
        self.invalidateIntrinsicContentSize()
    }
}
