//
//  ViewController.swift
//  resfebe
//
//  Created by MacBook on 29/05/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit
import EFInternetIndicator

class ViewController: UIViewController , InternetStatusIndicable{

    
    var internetConnectionIndicator:InternetViewIndicator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMonitoringInternet()
        
        //  Bu şekilde de kullanılabilir.  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //  self.startMonitoringInternet(backgroundColor:UIColor.blue, style: .StatusLine, textColor:UIColor.white, message:"No magic on internet here :(", remoteHostName: "magic.com")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

