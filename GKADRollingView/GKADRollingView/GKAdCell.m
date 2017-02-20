//
//  GKAdCell.m
//  GKADRollingView
//
//  Created by Gao on 2017/2/16.
//  Copyright © 2017年 gao. All rights reserved.
//

#import "GKAdCell.h"

@interface GKAdCell ()

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UILabel *lb;

@end

@implementation GKAdCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _btn = [UIButton new];
        _btn.frame = CGRectMake(10, (self.frame.size.height-16)/2, 32, 16);
        [_btn setTitleColor:_titleColor?:[UIColor orangeColor] forState:UIControlStateNormal];
        _btn.layer.cornerRadius = 3;
        _btn.layer.borderWidth = 1;
        _btn.layer.borderColor = _titleColor.CGColor?:[UIColor orangeColor].CGColor;
        _btn.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:_btn];
        
        _lb = [UILabel new];
        _lb.frame = CGRectMake(48, 0, self.frame.size.width-48, self.frame.size.height);
        _lb.font = _textFont?:[UIFont systemFontOfSize:12];
        _lb.textColor = _textColor?:[UIColor blackColor];
        _lb.numberOfLines = 0;
        [self.contentView addSubview:_lb];
    }
    return self;
}


- (void)setModel:(GKAdModel *)model {
    _model = model;
    if (model.title) {
        _btn.hidden = NO;
        _lb.frame = CGRectMake(48, 0, self.frame.size.width-48, self.frame.size.height);
    } else {
        _btn.hidden = YES;
        _lb.frame = CGRectMake(10, 0, self.frame.size.width-10, self.frame.size.height);
    }
    [_btn setTitle:model.title forState:UIControlStateNormal];
    _lb.text = model.content;
}

@end
