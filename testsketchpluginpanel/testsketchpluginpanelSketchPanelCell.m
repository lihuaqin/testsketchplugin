//
//  testsketchpluginpanelSketchPanelCell.m
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#import "testsketchpluginpanelSketchPanelCell.h"

@interface testsketchpluginpanelSketchPanelCell ()

@end

@implementation testsketchpluginpanelSketchPanelCell

- (NSView *)view {
    return self;
}

+ (instancetype)loadNibNamed:(NSString *)nibName {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:nibName bundle:[NSBundle bundleForClass:[self class]]];
    NSArray *views;
    [nib instantiateWithOwner:nil topLevelObjects:&views];

    NSArray *filtered = [views filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject isKindOfClass:[self class]];
    }]];

    return [filtered firstObject];
}

@end
