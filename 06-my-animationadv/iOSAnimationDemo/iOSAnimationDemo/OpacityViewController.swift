//
//  OpacityViewController.swift
//  iOSAnimationDemo
//
//  Created by zc on 2017/5/22.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    // 蓝色正方形
    @IBOutlet weak var blueSquare: UIView!
    
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
        UIView.animate(withDuration: 1, animations: {
            // 淡化效果
            self.blueSquare.alpha = 0.2
        })
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
