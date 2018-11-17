//
//  MyViewController.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
@interface MyViewController : NSViewController
    @property (weak) IBOutlet WebView *myWebView;

@end
