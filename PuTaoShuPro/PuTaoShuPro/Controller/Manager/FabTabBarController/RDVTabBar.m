// RDVTabBar.m
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//


#import "RDVTabBar.h"
#import "RDVTabBarItem.h"

@interface RDVTabBar ()

@property (nonatomic) CGFloat itemWidth;
@property (nonatomic) UIView *backgroundView;

@end

@implementation RDVTabBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitialization {
    _backgroundView = [[UIView alloc] init];
    _backgroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:_backgroundView];
    
    [self setTranslucent:NO];
}

- (void)layoutSubviews {
    CGSize frameSize = self.frame.size;
    CGFloat minimumContentHeight = [self minimumContentHeight];
    
   // [[self backgroundView] setFrame:CGRectMake(0, frameSize.height - minimumContentHeight,frameSize.width, frameSize.height)];
    [[self backgroundView] setFrame:CGRectMake(0, 0,
                                               frameSize.width, 49)];
    [self setItemWidth:roundf((frameSize.width - [self contentEdgeInsets].left -
                               [self contentEdgeInsets].right) / [[self items] count])];
    
    NSInteger index = 0;
    
    // Layout items
    
    for (RDVTabBarItem *item in [self items]) {
        CGFloat itemHeight = [item itemHeight];
        
        if (!itemHeight) {
            itemHeight = 49;
        }
        
        [item setFrame:CGRectMake(self.contentEdgeInsets.left + (index * self.itemWidth),
                                  roundf(49 - itemHeight) - self.contentEdgeInsets.top,
                                  self.itemWidth, itemHeight - self.contentEdgeInsets.bottom)];
        [item setNeedsDisplay];
        
        index++;
    }
}

#pragma mark - Configuration

- (void)setItemWidth:(CGFloat)itemWidth {
    if (itemWidth > 0) {
        _itemWidth = itemWidth;
    }
}

- (void)setItems:(NSArray *)items {
    for (RDVTabBarItem *item in items) {
        [item removeFromSuperview];
    }
    
    _items = [items copy];
    for (RDVTabBarItem *item in items) {
        [item addTarget:self action:@selector(tabBarItemWasSelected:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:item];
    }
}

- (void)setHeight:(CGFloat)height {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame), height)];
}

- (CGFloat)minimumContentHeight {
    CGFloat minimumTabBarContentHeight = CGRectGetHeight([self frame]);
    
    for (RDVTabBarItem *item in [self items]) {
        CGFloat itemHeight = [item itemHeight];
        if (itemHeight && (itemHeight < minimumTabBarContentHeight)) {
            minimumTabBarContentHeight = itemHeight;
        }
    }
    
    return minimumTabBarContentHeight;
}

#pragma mark - Item selection

- (void)tabBarItemWasSelected:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(tabBar:shouldSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:sender];
        if (![[self delegate] tabBar:self shouldSelectItemAtIndex:index]) {
            return;
        }
    }
    
    [self setSelectedItem:sender];
    
    if ([[self delegate] respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:self.selectedItem];
        [[self delegate] tabBar:self didSelectItemAtIndex:index];
    }
}

- (void)setSelectedItem:(RDVTabBarItem *)selectedItem {
    if (selectedItem == _selectedItem) {
        return;
    }
    [_selectedItem setSelected:NO];
    
    _selectedItem = selectedItem;
    [_selectedItem setSelected:YES];
}

#pragma mark - Translucency

- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    
    CGFloat alpha = (translucent ? 0.9 : 1.0);
    
    [_backgroundView setBackgroundColor:[UIColor colorWithRed:245/255.0
                                                        green:245/255.0
                                                         blue:245/255.0
                                                        alpha:alpha]];
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
