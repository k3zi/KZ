//
//  TableViewController.swift
//  Dawgtown
//
//  Created by Kesi Maduka on 7/31/15.
//  Copyright (c) 2015 Storm Edge Apps LLC. All rights reserved.
//

import UIKit

class KZTableViewController: KZViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView? = nil
    var items = [Any]()
    var offscreenCells = [String: KZTableViewCell]()
    var ct = true
    var showsNoText = true
    
    //MARK: Setup View
    
    convenience init(createTable: Bool) {
        self.init()
        self.ct = createTable
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if ct {
            tableView = UITableView(frame: view.bounds, style: .Grouped)
            tableView!.delegate = self
            tableView!.dataSource = self
            tableView?.separatorStyle = .None
            tableView?.showsVerticalScrollIndicator = false
            tableView?.sectionIndexBackgroundColor = RGB(224)
            tableView?.sectionIndexColor = RGB(103)
            view.addSubview(tableView!)
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        if ct {
            tableView!.autoPinToTopLayoutGuideOfViewController(self, withInset: 0.0)
            tableView!.autoPinEdgeToSuperviewEdge(.Left)
            tableView!.autoPinEdgeToSuperviewEdge(.Right)
            tableView!.autoPinEdgeToSuperviewEdge(.Bottom)
        }
    }
    
    //MARK: Tableview Datasource/Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tableViewCellData(tableView, section: section).count == 0 && showsNoText {
            return 1
        }
        
        return self.tableViewCellData(tableView, section: section).count
    }
    
    func tableViewCellClass(tableView: UITableView, indexPath: NSIndexPath? = nil) -> KZTableViewCell.Type {
        return KZTableViewCell.self
    }
    
    func tableViewCellData(tableView: UITableView, section: Int) -> [Any] {
        return items
    }
    
    func tableViewNoDataText(tableView: UITableView) -> String {
        return "No Results Found"
    }
    
    func tableViewShowsSectionHeader(tableView: UITableView) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.tableViewCellData(tableView, section: indexPath.section).count == 0 && showsNoText {
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "NoneFound")
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = tableViewNoDataText(tableView)
            cell.textLabel?.font = UIFont.systemFontOfSize(20, weight: UIFontWeightLight)
            cell.textLabel?.textAlignment = .Center
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.selectionStyle = .None
            tableView.userInteractionEnabled = false
            return cell
        }
        
        tableView.userInteractionEnabled = true
        let cell = tableViewCellClass(tableView, indexPath: indexPath).init(style: .Default, reuseIdentifier: String(tableView.tag))
            cell.setIndexPath(indexPath, last: indexPath.row == (self.tableView(tableView, numberOfRowsInSection: indexPath.section) - 1))
            if cell.tag != -1 {
                cell.setContent(tableViewCellData(tableView, section: indexPath.section)[indexPath.row])
            }
        cell.updateConstraintsIfNeeded()
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.tableViewCellData(tableView, section: indexPath.section).count == 0 && showsNoText {
            return tableView.frame.height
        }
        
        var cell = offscreenCells[String(tableViewCellClass(tableView, indexPath: indexPath))]
        if cell == nil {
            cell = tableViewCellClass(tableView, indexPath: indexPath).init(style: .Default, reuseIdentifier: String(tableView.tag))
            offscreenCells.updateValue(cell!, forKey: String(tableViewCellClass(tableView, indexPath: indexPath)))
        }
        
        cell!.setIndexPath(indexPath, last: (indexPath.row + 1) == tableViewCellData(tableView, section: indexPath.section).count)
        if cell!.tag != -1 {
            cell!.setContent(tableViewCellData(tableView, section: indexPath.section)[indexPath.row])
        }
        
        return cell!.getHeight()
    }
    
    func tableView(_tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
            cell.preservesSuperviewLayoutMargins = false
        }
    }
    
    //MARK: Section Header/Footer
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableViewShowsSectionHeader(tableView) {
            let view = UIView(frame: CGRectMake(0.0, 0.0, self.view.frame.size.width, 20))
            view.backgroundColor = RGB(240)
            
            let label = UILabel(frame: view.bounds)
            label.font = UIFont.systemFontOfSize(16)
            label.text = self.tableView(tableView, titleForHeaderInSection: section)
            label.sizeToFit()
            label.frame.size.height = view.frame.size.height
            label.frame.origin.x = 18
            view.addSubview(label)
            
            let line1 = UIView(frame: CGRectMake(0, 0, view.frame.size.width, (1.0/UIScreen.mainScreen().scale)))
            line1.backgroundColor = RGB(217)
            view.addSubview(line1)
            
            let line2 = UIView(frame: CGRectMake(0, view.frame.size.height - 1, view.frame.size.width, (1.0/UIScreen.mainScreen().scale)))
            line2.backgroundColor = RGB(217)
            view.addSubview(line2)
            
            return view
        }
        
        return nil
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableViewShowsSectionHeader(tableView) {
            return "Pending"
        }
        
        return nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableViewShowsSectionHeader(tableView) {
            return 19.0
        }
        
        return CGFloat.min
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var x = [String]()
        if tableViewShowsSectionHeader(tableView) {
            for var i = 0; i < numberOfSectionsInTableView(tableView); i++ {
                if let s = self.tableView(tableView, titleForHeaderInSection: i) {
                    x.append(s)
                }
            }
            
            return x
        }
        
        return []
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

struct TableSection {
    var sectionName: String
    var sectionObjects: [Any]
}
