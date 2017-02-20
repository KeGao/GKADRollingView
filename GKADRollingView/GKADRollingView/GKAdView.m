//
//  GKAdView.m
//  GKADRollingView
//
//  Created by Gao on 2017/2/16.
//  Copyright © 2017年 gao. All rights reserved.
//

#import "GKAdView.h"

#define GKCell  @"GKAdCell"

@interface GKAdView () <UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSTimer *_timer;
    UICollectionView *_collectionView;
}


@end

@implementation GKAdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setModelArr:(NSArray<GKAdModel *> *)modelArr {
    _modelArr = modelArr;
    if (_modelArr.count > 0 && !_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[GKAdCell class] forCellWithReuseIdentifier:GKCell];
        
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        
        if (_timer == nil) {
            _timer = [NSTimer timerWithTimeInterval:_duration?:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
            NSRunLoop *runloop=[NSRunLoop currentRunLoop];
            [runloop addTimer:_timer forMode:NSRunLoopCommonModes];
        }
    }
}

- (void)starTimer {
    //开启定时器
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)stopTimer {
    //暂停定时器
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)nextPage {
    NSInteger row = _collectionView.indexPathsForVisibleItems.lastObject.item;
    
    if (row == _modelArr.count) {
        row=0;
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    row++;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    });
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modelArr.count+1;
}


- (GKAdCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GKAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GKCell forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.model = _modelArr.lastObject;
    } else {
        cell.model = _modelArr[indexPath.row-1];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        self.clickAdBlock(_modelArr.lastObject.path);
    } else {
        self.clickAdBlock(_modelArr[indexPath.row-1].path);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
