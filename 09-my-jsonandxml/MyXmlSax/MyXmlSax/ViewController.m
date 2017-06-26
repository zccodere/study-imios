//
//  ViewController.m
//  MyXmlSax
//
//  Created by zc on 2017/6/2.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

/*
 XML解析
 
 要求解析以下XML字符串
    a.<info>James</info>
    b.<info name="James"></info>
    c.<info><name>James</name></info>
    d.<info><name>James</name><name>Jim</name></info>
 目的
    1.掌握使用SAX(Simple API for XML)方式解析XML
    2.了解SAX解析XML的基本原理
 重点
    1.NSXMLParser类的使用
    2.5个代理函数
        a. - (void)parserDidStartDocument:(NSXMLParser *)parser //准备解析
        b. - (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:
            (NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)
            attributeDict //准备解析当前节点
        c. - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string // 获取收尾节点间内容
        d. - (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:
            (NSString *)namespaceURI qualifiedName:(NSString *)qName // 解析完当前节点
        e. - (void)parserDidEndDocument:(NSXMLParser *)parser // 解析结束
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 解析数据按钮点击事件
- (IBAction)onParse:(id)sender {
    //NSString *xmlStr1 = @"<info>James</info>";
    //NSString *xmlStr2 = @"<info name=\"James\"></info>";
    //NSString *xmlStr3 = @"<info><name>James</name></info>";
    NSString *xmlStr4 = @"<info><name>James</name><name>Jim</name></info>";
    
    NSData *xmlDaTa = [xmlStr4 dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlDaTa];
    xmlParser.delegate = self;
    [xmlParser parse];
}

// 准备解析
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    [self appendPrintln];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"准备解析"];
    
}
// 准备解析当前节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    [self appendPrintln];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"准备解析当前节点为："];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:elementName];
    //[self appendPrintln];
    //_tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"属性值为："];
    //_tvParseResult.text = [_tvParseResult.text stringByAppendingString:[attributeDict objectForKey:@"name"]];

}
// 获取首尾节点间内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self appendPrintln];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:string];

}
// 解析完当前节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    [self appendPrintln];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"解析完当前节点"];
}
// 解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self appendPrintln];
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"结束解析"];
}

- (void)appendPrintln{
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
}

@end

