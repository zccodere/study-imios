//
//  ViewController.h
//  MyXmlSax
//
//  Created by zc on 2017/6/2.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITextView *tvParseResult;

- (IBAction)onParse:(id)sender;

@end

