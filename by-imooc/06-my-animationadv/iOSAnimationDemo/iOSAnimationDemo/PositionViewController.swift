//
//  PositionViewController.swift
//  iOSAnimationDemo
//
//  Created by zc on 2017/5/22.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    
    // 蓝色正方形
    @IBOutlet weak var blueSquare: UIView!
    // 红色正方形
    @IBOutlet weak var redSquare: UIView!
    // 绿色正方形
    @IBOutlet weak var greenSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 动画效果一
        UIView.animate(withDuration: 2, animations: {
            // 从左边移动到右边
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            /*
            // 从顶部移动到底部
            self.redSquare.center.y = self.view.bounds.height - self.redSquare.center.y
            
            // 同时从左边到右边和从顶部到底部
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            self.greenSquare.center.y = self.view.bounds.height - self.greenSquare.center.y
            */
            
        })
        
        // 动画效果二
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            super.viewDidAppear(animated)
            
            // 从顶部移动到底部
            self.redSquare.center.y = self.view.bounds.height - self.redSquare.center.y
            
        }, completion: nil)
        
        // 动画效果三
        UIView.animate(withDuration: 1, delay: 1, animations: {
            super.viewDidAppear(animated)
            
            // 同时从左边到右边和从顶部到底部
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            self.greenSquare.center.y = self.view.bounds.height - self.greenSquare.center.y
            
        }, completion: nil)

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
