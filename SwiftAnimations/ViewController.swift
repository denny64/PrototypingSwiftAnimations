//
//  ViewController.swift
//  PrototypingSwiftAnimations
//
//  Created by Rafael Sachetto on 11/3/14.
//  Copyright (c) 2014 Rafael Sachetto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfFishSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateButtonPressed(sender: AnyObject) {
        // the slider value returns a float (e.g. 10.4)
        // to work in the loop we need to round down as an Int (e.g. 10)
        let numberOfFish = Int(self.numberOfFishSlider.value)
        
        for loopNumber in 1...numberOfFish {
            
            // set up some constants for the animation
            let duration = 1.0
            let options  = UIViewAnimationOptions.CurveLinear
            
            // randomly assign a delay of 0.9 to 1s
            let delay = (NSTimeInterval((Int(rand()) %  900)) + 100.0) / 1000.0
            
            // set up some constants for the fish
            let size : CGFloat      = CGFloat(Int(rand()) % 40) + 20.0
            let yPosition : CGFloat = CGFloat(Int(rand()) % 200) + 20.0
            
            // create the fish
            let fish   = UIImageView()
            fish.image = UIImage(named: "blue-fish")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(fish)
            
            // define the animation
            UIView.animateWithDuration(duration,
                delay: delay,
                options: options,
                animations: {
                    
                    // move the fish
                    fish.frame = CGRectMake(320, yPosition, size, size)
                
                }, completion: { animationFinished in
                    
                    // remove the fish
                    fish.removeFromSuperview()
            })
        }
    }

}
