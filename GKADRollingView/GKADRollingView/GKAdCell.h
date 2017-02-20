//
//  GKAdCell.h
//  GKADRollingView
//
//  Created by Gao on 2017/2/16.
//  Copyright © 2017年 gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKAdModel.h"

@interface GKAdCell : UICollectionViewCell

@property (nonatomic, strong) GKAdModel *model;

@property (nonatomic, strong) UIColor *titleColor;      // default is orange

@property (nonatomic, strong) UIFont *textFont;         // default is 12

@property (nonatomic, strong) UIColor *textColor;       // default is black

@end
