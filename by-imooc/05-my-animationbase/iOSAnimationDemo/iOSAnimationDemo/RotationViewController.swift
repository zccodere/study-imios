//
//  RotationViewController.swift
//  iOSAnimationDemo
//
//  Created by zc on 2017/5/22.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    
    // 轮转图
    @IBOutlet weak var wheel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func spin() {
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            // 旋转半圈
            //(translationX: self.wheel.transform, y: CGFloat(Double.pi))
            self.wheel.transform = self.wheel.transform.rotated(by: CGFloat(Double.pi))
        }, completion: {(finished) -> Void in
                self.spin()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.spin()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
