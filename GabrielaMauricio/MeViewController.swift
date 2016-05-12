//
//  MeViewController.swift
//  GabrielaMauricio
//
//  Created by Gabriela Schirmer Mauricio on 4/21/15.
//  Copyright (c) 2015 Gabriela Schirmer Mauricio. All rights reserved.
//

import Foundation
import UIKit

class MeViewController: UIViewController { // class for self introduction
    
    @IBOutlet weak var myScroll: UIScrollView!
    @IBOutlet weak var hiimage: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var picture: UIImageView!
    
    
    var arrayURLwww = [String]()
    var arrayURLApp = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayURLwww = ["https://www.flickr.com/photos/gabischima/sets/", "https://www.dropbox.com/sh/1k3849s8ntaa7bi/AACbWKNuKkzN0HeYmnJYCSuEa?dl=0"]
    }
    
    @IBAction func openURL(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: arrayURLwww[sender.tag])!)
    }
}
