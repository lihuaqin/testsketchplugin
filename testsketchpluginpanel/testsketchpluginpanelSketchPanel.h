//
//  testsketchpluginpanelSketchPanel.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "testsketchpluginpanelSketchPanelDataSource.h"
#import "testsketchpluginpanelMSInspectorStackView.h"

@class testsketchpluginpanelSketchPanelCell;

@interface testsketchpluginpanelSketchPanel : NSObject

@property (nonatomic, strong, readonly) NSArray *views;
@property (nonatomic, weak) id <testsketchpluginpanelMSInspectorStackView> stackView;
@property (nonatomic, weak) id <testsketchpluginpanelSketchPanelDataSource> datasource;

- (instancetype)initWithStackView:(id <testsketchpluginpanelMSInspectorStackView>)stackView;
- (void)reloadData;
- (testsketchpluginpanelSketchPanelCell *)dequeueReusableCellForReuseIdentifier:(NSString *)identifier;

@end
