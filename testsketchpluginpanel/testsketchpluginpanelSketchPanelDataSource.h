//
//  testsketchpluginpanelSketchPanelDataSource.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@class testsketchpluginpanelSketchPanel;
@class testsketchpluginpanelSketchPanelCell;

@protocol testsketchpluginpanelSketchPanelDataSource <NSObject>

- (NSUInteger)numberOfRowsFortestsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel;
- (testsketchpluginpanelSketchPanelCell *)testsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel itemForRowAtIndex:(NSUInteger)index;
- (testsketchpluginpanelSketchPanelCell *)headerFortestsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel;

@end
