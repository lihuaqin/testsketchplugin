//
//  testsketchpluginpanelSketchPanelController.m
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import "testsketchpluginpanelSketchPanelController.h"
#import "testsketchpluginpanelSketchPanelCell.h"
#import "testsketchpluginpanelSketchPanelCellHeader.h"
#import "testsketchpluginpanelSketchPanelCellDefault.h"
#import "testsketchpluginpanelSketchPanel.h"
#import "testsketchpluginpanelSketchPanelDataSource.h"


@interface testsketchpluginpanelSketchPanelController ()

@property (nonatomic, strong) id <testsketchpluginpanelMSInspectorStackView> stackView; // MSInspectorStackView
@property (nonatomic, strong) id <testsketchpluginpanelMSDocument> document;
@property (nonatomic, strong) testsketchpluginpanelSketchPanel *panel;
@property (nonatomic, copy) NSArray *selection;

@end

@implementation testsketchpluginpanelSketchPanelController

- (instancetype)initWithDocument:(id <testsketchpluginpanelMSDocument>)document {
    if (self = [super init]) {
        _document = document;
        _panel = [[testsketchpluginpanelSketchPanel alloc] initWithStackView:nil];
        _panel.datasource = self;
    }
    return self;
}

- (void)selectionDidChange:(NSArray *)selection {
    self.selection = [selection valueForKey:@"layers"];         // To get NSArray from MSLayersArray

    self.panel.stackView = [(NSObject *)_document valueForKeyPath:@"inspectorController.currentController.stackView"];
    [self.panel reloadData];
}

#pragma mark - testsketchpluginpanelSketchPanelDataSource

- (testsketchpluginpanelSketchPanelCell *)headerFortestsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel {
    testsketchpluginpanelSketchPanelCellHeader *cell = (testsketchpluginpanelSketchPanelCellHeader *)[panel dequeueReusableCellForReuseIdentifier:@"header"];
    if ( ! cell) {
        cell = [testsketchpluginpanelSketchPanelCellHeader loadNibNamed:@"testsketchpluginpanelSketchPanelCellHeader"];
        cell.reuseIdentifier = @"header";
    }
    cell.titleLabel.stringValue = @"testsketchpluginpanel";
    return cell;
}

- (NSUInteger)numberOfRowsFortestsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel {
    return self.selection.count;    // Using self.selection as number of rows in the panel
}

- (testsketchpluginpanelSketchPanelCell *)testsketchpluginpanelSketchPanel:(testsketchpluginpanelSketchPanel *)panel itemForRowAtIndex:(NSUInteger)index {
    testsketchpluginpanelSketchPanelCellDefault *cell = (testsketchpluginpanelSketchPanelCellDefault *)[panel dequeueReusableCellForReuseIdentifier:@"cell"];
    if ( ! cell) {
        cell = [testsketchpluginpanelSketchPanelCellDefault loadNibNamed:@"testsketchpluginpanelSketchPanelCellDefault"];
        cell.reuseIdentifier = @"cell";
    }

    id layer = self.selection[index];
    cell.titleLabel.stringValue = [layer name];
    cell.imageView.image = [layer valueForKeyPath:@"previewImages.LayerListPreviewUnfocusedImage"];

    return cell;
}

@end
