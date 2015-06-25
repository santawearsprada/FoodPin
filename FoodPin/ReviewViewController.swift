//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by SANTIPONG TANCHATCHAWAL on 4/20/15.
//  Copyright (c) 2015 SANTIPONG TANCHATCHAWAL. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroudImageView: UIImageView!
    
    @IBOutlet weak var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroudImageView.addSubview(blurEffectView)
        
        //dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        // move dialogView off the screen down
        //dialogView.transform = CGAffineTransformMakeTranslation(0, 500)
        
        // combine two transformations
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: { self.dialogView.transform = CGAffineTransformMakeScale(1.0,1.0) }, completion: nil)
        
        // Spring Animation
        //UIView.animateWithDuration(1.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: nil, animations: { self.dialogView.transform = CGAffineTransformMakeScale(1, 1) }, completion: nil)
        
        // Slide the dialog up
        //UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { self.dialogView.transform = CGAffineTransformMakeTranslation(0.0, 0.0) }, completion: nil)
        
        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
                let scale = CGAffineTransformMakeScale(1, 1)
                let translate = CGAffineTransformMakeTranslation(0, 0)
                self.dialogView.transform = CGAffineTransformConcat(scale, translate)
            
            }
            , completion: nil)
        
        
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
