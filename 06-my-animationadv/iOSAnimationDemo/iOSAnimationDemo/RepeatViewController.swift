//
//  RepeatViewController.swift
//  iOSAnimationDemo
//
//  Created by zc on 2017/5/22.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

import UIKit

class RepeatViewController: UIViewController {
    
    // 蓝色方块
    @IBOutlet weak var blueSquare: UIView!
    // 红色方块
    @IBOutlet weak var redSquare: UIView!
    // 绿色方块
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
        
        UIView.animate(withDuration: 1, animations: {
            // 蓝色方块从左边移动到右边
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
        })
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .repeat, animations: {
            // 红色方块重复执行从左边移动到右边
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
        }, completion: nil)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            // 绿色方块重复执行从左边移动到右边然后从右边移动到左边
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
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
