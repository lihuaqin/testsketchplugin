//
//  testsketchpluginpanelSketchPanelController.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

@import Cocoa;
#import "testsketchpluginpanelMSDocument.h"
#import "testsketchpluginpanelMSInspectorStackView.h"
#import "testsketchpluginpanelSketchPanelDataSource.h"
@class testsketchpluginpanelSketchPanel;

@interface testsketchpluginpanelSketchPanelController : NSObject <testsketchpluginpanelSketchPanelDataSource>

@property (nonatomic, strong, readonly) id <testsketchpluginpanelMSInspectorStackView> stackView; // MSInspectorStackView
@property (nonatomic, strong, readonly) id <testsketchpluginpanelMSDocument> document;
@property (nonatomic, strong, readonly) testsketchpluginpanelSketchPanel *panel;

- (instancetype)initWithDocument:(id <testsketchpluginpanelMSDocument>)document;
- (void)selectionDidChange:(NSArray *)selection;

@end
