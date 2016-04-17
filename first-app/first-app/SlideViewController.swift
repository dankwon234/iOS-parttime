//
//  SlideViewController.swift
//  first-app
//
//  Created by Dan Kwon on 4/17/16.
//  Copyright © 2016 dankwon. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
    
    @IBOutlet var slideView: UIScrollView!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideView.contentSize = CGSize(width: 600, height: 200)
        self.slideView.pagingEnabled = true
        
        let firstImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstImage.image = UIImage(named: "apple.png")
        firstImage.backgroundColor = UIColor.yellowColor()
        self.slideView.addSubview(firstImage)

        
        let secondImage = UIImageView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondImage.backgroundColor = UIColor.blueColor()
        secondImage.image = UIImage(named: "starbucks.png")
        self.slideView.addSubview(secondImage)

        let thirdImage = UIImageView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdImage.backgroundColor = UIColor.greenColor()
        thirdImage.image = UIImage(named: "wework.png")
        self.slideView.addSubview(thirdImage)
        
        
        var y = self.slideView.frame.origin.y+self.slideView.frame.size.height+30
        let x = CGFloat(24)
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("Tap Me!", forState: .Normal)
        btn.frame = CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 44)
        btn.backgroundColor = UIColor.greenColor()
        btn.addTarget(self, action: #selector(SlideViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        y += btn.frame.size.height+30
        
        self.label = UILabel(frame: CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 22))
        self.label.textColor = UIColor.darkGrayColor()
        self.label.text = "Hello"
        self.label.textAlignment = .Center
        self.view.addSubview(self.label)
        
//        let swtichBtn = UISwitch(frame: CGRect(x: 0, y: 0, width: 40, height: 22))
        
        
    }
    
    func buttonTapped(btn: UIButton){
        let offset = self.slideView.contentOffset.x
        print("buttonTapped: \(offset)")
        
        if (offset == 0){
            self.label.text = "Apple"
        }
        if (offset == 200){
            self.label.text = "Starbucks"
        }
        if (offset == 400){
            self.label.text = "WeWork"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
