//
//  testsketchpluginpanel.m
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "testsketchpluginpanel.h"
#import <CocoaScript/COScript.h>
#import "testsketchpluginpanelSketchPanelController.h"
@import JavaScriptCore;
#import <Mocha/Mocha.h>
#import <Mocha/MOClosure.h>
#import <Mocha/MOJavaScriptObject.h>
#import <Mocha/MochaRuntime_Private.h>
#import "MyViewController.h"


@interface testsketchpluginpanel : NSObject

@property (nonatomic, strong) testsketchpluginpanelSketchPanelController *panelController;
@property (nonatomic, strong) id <testsketchpluginpanelMSDocument> document;
@property (nonatomic, copy) NSString *panelControllerClassName;
@property (nonatomic, strong) NSWindow *myWindow;

+ (instancetype)onSelectionChanged:(id)context;
- (void)onSelectionChange:(NSArray *)selection;
+ (void)setSharedCommand:(id)command;

@end



@implementation testsketchpluginpanel

static id _command;

+ (void)setSharedCommand:(id)command {
    _command = command;
}

+ (id)sharedCommand {
    return _command;
}

+ (instancetype)onSelectionChanged:(id)context {

//    COScript *coscript = [COScript currentCOScript];

    id <testsketchpluginpanelMSDocument> document = [context valueForKeyPath:@"actionContext.document"];
    if ( ! [document isKindOfClass:NSClassFromString(@"MSDocument")]) {
        document = nil;  // be safe
        return nil;
    }

    if ( ! [self sharedCommand]) {
        [self setSharedCommand:[context valueForKeyPath:@"command"]]; // MSPluginCommand
    }

    NSString *key = [NSString stringWithFormat:@"%@-testsketchpluginpanel", [document description]];
    __block testsketchpluginpanel *instance = [[Mocha sharedRuntime] valueForKey:key];

    if ( ! instance) {
//        [coscript setShouldKeepAround:YES];
        instance = [[self alloc] initWithDocument:document];
        [[Mocha sharedRuntime] setValue:instance forKey:key];
    }

    NSArray *selection = [context valueForKeyPath:@"actionContext.document.selectedLayers"];
//    NSLog(@"selection %p %@ %@", instance, key, selection);
    [instance onSelectionChange:selection];
    return instance;
}

- (instancetype)initWithDocument:(id <testsketchpluginpanelMSDocument>)document {
    if (self = [super init]) {
        _document = document;
        _panelController = [[testsketchpluginpanelSketchPanelController alloc] initWithDocument:_document];
    }
    return self;
}

- (void)onSelectionChange:(NSArray *)selection {
    //[_panelController selectionDidChange:selection];
    NSLog(@"selection");
    NSRect frame = CGRectMake(0, 0, 1880, 800);
    NSUInteger style = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;
    self.myWindow = [[NSWindow alloc] initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
    //self.myWindow= [[NSWindow alloc] init];
    //2.设置窗口根控制器
    //2.1通过xib创建窗口的根控制器:initWithNibName
    //NibName:xib名称
    // MyViewController *vc = [[MyViewController alloc] initWithNibName:@"MyViewController"bundle:nil];
    //MyViewController *vc = [[MyViewController alloc] init];
    MyViewController *vc = [[MyViewController alloc] initWithNibName:@"MyViewController"bundle:[NSBundle bundleForClass:[self class]]];
    self.myWindow.contentViewController= vc ;
    //3.显示窗口
    [self.myWindow makeKeyAndOrderFront:self];
}

@end
