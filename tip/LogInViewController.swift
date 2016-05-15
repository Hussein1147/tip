//
//  LogInViewController.swift
//  tip
//
//  Created by DJIBRIL KEITA on 2/28/16.
//  Copyright © 2016 DJIBRILKEITA. All rights reserved.
//

import Foundation
import UIKit
import TextFieldEffects

class LogInViewController: UIViewController {
    
    @IBOutlet var email: YokoTextField!
    @IBOutlet var password: YokoTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let nav: UINavigationBar =  self.navigationController!.navigationBar
        
        nav.tintColor = UIColor(colorLiteralRed: 72.0/255.0, green: 211.0/255.0, blue: 178.0/255.0, alpha: 1)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(){
    
        
    
    }
}

