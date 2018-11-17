//
//  MyViewController.m
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSString *urlString = @"/Users/li/Desktop/index.html";
    [[self.myWebView  mainFrame ] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

@end
