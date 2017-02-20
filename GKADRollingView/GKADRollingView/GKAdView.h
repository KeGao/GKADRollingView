//
//  GKAdView.h
//  GKADRollingView
//
//  Created by Gao on 2017/2/16.
//  Copyright © 2017年 gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKAdCell.h"

@interface GKAdView : UIView

typedef void(^GKAdViewTapBlock) (NSString *path);

@property (nonatomic, copy) GKAdViewTapBlock clickAdBlock;

//@property (nonatomic, strong) UIImage *leftIcon;

@property (nonatomic, strong) NSArray<GKAdModel *> *modelArr;

@property (nonatomic, strong) UIColor *titleColor;      // default is orange

@property (nonatomic, strong) UIFont *textFont;         // default is 12

@property (nonatomic, strong) UIColor *textColor;       // default is black

@property (nonatomic, assign) NSTimeInterval duration;  // default is 3s

@end
