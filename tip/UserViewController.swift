//
//  ViewController.swift
//  tip
//
//  Created by DJIBRIL KEITA on 2/27/16.
//  Copyright © 2016 DJIBRILKEITA. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class UserViewController: UIViewController, UITableViewDataSource {
    
    
    var myCustomBar: tipBar?
    @IBOutlet var tableView: UITableView!
    
    var delegateSplitter: BLKDelegateSplitter?
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        print("\(demoData[0]["email"]!)")        
        self.setNeedsStatusBarAppearanceUpdate()
            
        self.myCustomBar = tipBar(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100.0))
        let behaviorDefiner: SquareCashStyleBehaviorDefiner = SquareCashStyleBehaviorDefiner()
        behaviorDefiner.addSnappingPositionProgress(0.0, forProgressRangeStart: 0.0, end: 0.5)
        behaviorDefiner.addSnappingPositionProgress(1.0, forProgressRangeStart: 0.5, end: 1.0)
        behaviorDefiner.snappingEnabled = true
        behaviorDefiner.elasticMaximumHeightAtTop = true
        self.myCustomBar?.behaviorDefiner = behaviorDefiner
            
        //Configure a seperate del and data src
        
        self.delegateSplitter = BLKDelegateSplitter(firstDelegate: behaviorDefiner, secondDelegate: self)
            
        self.tableView.delegate = self.delegateSplitter
        
        self.view.addSubview(self.myCustomBar!)
        
        //set up table view
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"Cell")
        self.tableView.contentInset = UIEdgeInsetsMake(self.myCustomBar!.maximumBarHeight, 0.0, 0.0, 0.0)
            
        
        //add closing button
        
            
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    func prefferedStatusBarStyle()-> UIStatusBarStyle {
            return UIStatusBarStyle.LightContent
    }
    
    
    func closeViewController(sender: AnyObject){
    
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.whiteColor()
        return cell
    }


}

extension UserViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
}
