//
//  testsketchpluginpanelSketchPanel.m
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import "testsketchpluginpanelSketchPanel.h"
#import "testsketchpluginpanelSketchPanelCell.h"

@interface testsketchpluginpanelSketchPanel ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) NSMutableDictionary *recycler;

@end

@implementation testsketchpluginpanelSketchPanel

- (instancetype)initWithStackView:(id<testsketchpluginpanelMSInspectorStackView>)stackView {
    self = [super init];
    if (self) {
        _stackView = stackView;
        _recycler = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray *)views {
    return [self.items valueForKeyPath:@"view"];
}

- (void)recycleCell:(testsketchpluginpanelSketchPanelCell *)cell {
    NSString *identifier = [cell reuseIdentifier];

    if ( ! identifier) {
        return;
    }

    NSMutableSet *set = _recycler[identifier];
    if ( ! set) {
        set = [NSMutableSet set];
        _recycler[identifier] = set;
    }
    [set addObject:cell];
}

- (testsketchpluginpanelSketchPanelCell *)dequeueReusableCellForReuseIdentifier:(NSString *)identifier {
    NSMutableSet *set = _recycler[identifier];
    id cell = [set anyObject];
    if (cell) {
        [set removeObject:cell];
    }
    return cell;
}

- (void)reloadData {
    NSMutableArray *sectionViewControllers = [[_stackView sectionViewControllers] mutableCopy];

    // Make sure don't add two instance of the same controller
    if ([sectionViewControllers indexOfObject:self] == NSNotFound) {
        [sectionViewControllers addObject:self];
    }

    //NSUInteger count = [self.datasource numberOfRowsFortestsketchpluginpanelSketchPanel:self];
    NSUInteger count = 5;
    NSMutableArray *items = [NSMutableArray array];

    // Add header
    [items insertObject:[self.datasource headerFortestsketchpluginpanelSketchPanel:self] atIndex:0];

    // Add cells
    for (NSUInteger i = 0; i < count; i++) {
        [items addObject:[self.datasource testsketchpluginpanelSketchPanel:self itemForRowAtIndex:i]];
    }

    // Recycle cells
    [self.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self recycleCell:obj];
    }];

    self.items = items;
    [_stackView reloadWithViewControllers:sectionViewControllers];
}

- (BOOL)wantsSeparatorBetweenView:(NSView *)view andView:(NSView *)nextView {
    if ( view == [self.items firstObject]
        || ! nextView) { // At the first and the end
        return YES;
    }
    return NO;
}

@end
