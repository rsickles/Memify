//
//  CardView.m
//  Memify
//
//  Created by Ryan Sickles on 7/23/14.
//  Copyright (c) 2014 sickles.ryan. All rights reserved.
//

#import "CardView.h"
#import "ImageView.h"
#import "Card.h"

static const CGFloat ChoosePersonViewImageLabelWidth = 42.f;
@interface CardView ()
@property (nonatomic, strong) UIView *informationView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) ImageView *cameraImageLabelView;
@property (nonatomic, strong) ImageView *interestsImageLabelView;
@property (nonatomic, strong) ImageView *friendsImageLabelView;
@end

@implementation CardView


- (instancetype)initWithFrame:(CGRect)frame card:(Card *)card options:(MDCSwipeToChooseViewOptions *)options
{
    self = [super initWithFrame:frame];
    if (self) {
        _card = card;
        self.imageView.image = _card.image;
        NSLog(@"THIS IS THE CARD IMAGE %@",_card);
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleBottomMargin;
        self.imageView.autoresizingMask = self.autoresizingMask;
        
        [self constructInformationView];
    }
    return self;
}

#pragma mark - Internal Methods

- (void)constructInformationView {
    CGFloat bottomHeight = 60.f;
    CGRect bottomFrame = CGRectMake(0,
                                    CGRectGetHeight(self.bounds) - bottomHeight,
                                    CGRectGetWidth(self.bounds),
                                    bottomHeight);
    _informationView = [[UIView alloc] initWithFrame:bottomFrame];
    _informationView.backgroundColor = [UIColor whiteColor];
    _informationView.clipsToBounds = YES;
    _informationView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:_informationView];
    
    [self constructNameLabel];
    [self constructCameraImageLabelView];
    [self constructInterestsImageLabelView];
    [self constructFriendsImageLabelView];
}

- (void)constructNameLabel {
    CGFloat leftPadding = 12.f;
    CGFloat topPadding = 17.f;
    CGRect frame = CGRectMake(leftPadding,
                              topPadding,
                              floorf(CGRectGetWidth(_informationView.frame)/2),
                              CGRectGetHeight(_informationView.frame) - topPadding);
    _nameLabel = [[UILabel alloc] initWithFrame:frame];
    _nameLabel.text = [NSString stringWithFormat:@"%@",@"Sender Name"];
    [_informationView addSubview:_nameLabel];
}


- (void)constructCameraImageLabelView {
    CGFloat rightPadding = 10.f;
    UIImage *image = [UIImage imageNamed:@"camera"];
    _cameraImageLabelView = [self buildImageLabelViewLeftOf:CGRectGetWidth(_informationView.bounds) - rightPadding
                                                      image:image
                                                       text:@"asdf"];
    [_informationView addSubview:_cameraImageLabelView];
}

- (void)constructInterestsImageLabelView {
    UIImage *image = [UIImage imageNamed:@"book"];
    _interestsImageLabelView = [self buildImageLabelViewLeftOf:CGRectGetMinX(_cameraImageLabelView.frame)
                                                         image:image
                                                          text:@"asdf"];
    [_informationView addSubview:_interestsImageLabelView];
}

- (void)constructFriendsImageLabelView {
    UIImage *image = [UIImage imageNamed:@"group"];
    _friendsImageLabelView = [self buildImageLabelViewLeftOf:CGRectGetMinX(_interestsImageLabelView.frame)
                                                       image:image
                                                        text:@"asdf"];
    [_informationView addSubview:_friendsImageLabelView];
}

- (ImageView *)buildImageLabelViewLeftOf:(CGFloat)x image:(UIImage *)image text:(NSString *)text {
    CGRect frame = CGRectMake(x - ChoosePersonViewImageLabelWidth,
                              0,
                              ChoosePersonViewImageLabelWidth,
                              CGRectGetHeight(_informationView.bounds));
    ImageView *view = [[ImageView alloc] initWithFrame:frame
                                                           image:image
                                                            text:text];
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    return view;
}


@end
