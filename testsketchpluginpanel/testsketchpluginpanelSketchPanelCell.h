//
//  testsketchpluginpanelSketchPanelCell.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class testsketchpluginpanelSketchPanelCell;

@interface testsketchpluginpanelSketchPanelCell : NSView

@property (nonatomic, copy) NSString *reuseIdentifier;

+ (instancetype)loadNibNamed:(NSString *)nibName;

@end
