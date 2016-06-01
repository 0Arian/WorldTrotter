//
//  WebsiteViewController.swift
//  WorldTrotter
//
//  Created by Arian Moslem on 5/27/16.
//  Copyright © 2016 Arian Moslem. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {
    
    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asdf = NSURL(string: "https://www.bignerdranch.com")
        let req = NSURLRequest(URL: asdf!)
        webView.loadRequest(req)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated
    }
}
