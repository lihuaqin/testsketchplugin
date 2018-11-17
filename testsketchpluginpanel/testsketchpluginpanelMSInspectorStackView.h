//
//  testsketchpluginpanelMSInspectorStackView.h
//  testsketchplugin
//
//  Created by li on 18/11/18.
//  Copyright © 2018年 li. All rights reserved.
//

#ifndef testsketchpluginpanelMSInspectorStackView_h
#define testsketchpluginpanelMSInspectorStackView_h

@protocol testsketchpluginpanelMSInspectorStackView <NSObject>

@property (nonatomic, strong) NSArray *sectionViewControllers;
- (void)reloadWithViewControllers:(NSArray *)controllers;

@end

#endif /* testsketchpluginpanelMSInspectorStackView_h */
