//
//  InterfaceController.swift
//  MyConflictResolver Watch App Extension
//
//  Created by zc on 2017/5/22.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var actionImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func playTappad() {
        // 动画效果
        actionImage.setImageNamed("action")
        actionImage.startAnimatingWithImages(in: NSRange(location: 0,length: 3), duration: 0.4, repeatCount: 5)
        
        // 等待0.9秒后执行
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            // 随机生成0-2之间的整数
            let imageName = arc4random_uniform(3)
            self.actionImage.setImageNamed("action\(imageName)")
        }
    }
}
