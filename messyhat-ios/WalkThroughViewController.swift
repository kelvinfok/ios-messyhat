//
//  WalkThroughViewController.swift
//  messyhat-ios
//
//  Created by kelvinfok on 30/7/16.
//  Copyright © 2016 kelvinfok. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var index = 0
    var headerText = ""
    var imageName = ""
    var descriptionText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = headerText
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
        pageControl.currentPage = index
        
        startButton.hidden = (index == 2) ? false : true
        nextButton.hidden = (index == 2) ? true : false
        startButton.layer.cornerRadius = 5.0
        startButton.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startClicked(sender: AnyObject) {
        
       let userDefaults = NSUserDefaults.standardUserDefaults()
       userDefaults.setBool(true, forKey: "DisplayedWalkthrough")
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextClicked(sender: AnyObject) {
        let pageViewController = self.parentViewController as! PageViewController
        pageViewController.nextPageWithIndex(index)
    }
}