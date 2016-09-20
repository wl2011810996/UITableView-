//
//  SubCell.m
//  UITableView计算高度
//
//  Created by 荣耀iMac on 16/9/19.
//  Copyright © 2016年 wleleven. All rights reserved.
//

#import "SubCell.h"
#import "SubModel.h"
#import "Masonry.h"
#import "MASConstraint.h"

@interface SubCell()

@property (strong, nonatomic) UIImageView * imgView;
@property (strong, nonatomic) UILabel * introLabel;

@end


@implementation SubCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (nil != self) {
        [self setupView];
    }
    
    return self;
}

//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.introLabel sizeThatFits:size].height;
////    totalHeight += [self.contentLabel sizeThatFits:size].height;
////    totalHeight += [self.contentImageView sizeThatFits:size].height;
////    totalHeight += [self.usernameLabel sizeThatFits:size].height;
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}

/**
 *  初始化视图.
 */
- (void) setupView
{
    self.imgView = [[UIImageView alloc] init];
    self.introLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview: self.imgView];
    [self.contentView addSubview: self.introLabel];
    
    self.introLabel.numberOfLines = 0;
    
//    self.imgView.frame = CGRectMake(8,8, 60, 60);
//    
////    self.introLabel = 
    
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@8);
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(60, 60)]);
        make.bottom.lessThanOrEqualTo(@-8).priorityHigh();
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(8);
        make.top.equalTo(self.imgView);
        make.right.equalTo(@-8);
        make.bottom.equalTo(@-8);
    }];
    
//    [self.imgView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(8);
//        make.size.equalTo(CGSizeMake(60, 60));
//        make.bottom.lessThanOrEqualTo(-8).priorityHigh();
//    }];
//    
//    [self.introLabel makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.imgView.right).offset(8);
//        make.top.equalTo(self.imgView);
//        make.right.equalTo(-8);
//        make.bottom.equalTo(-8);
//    }];
}

- (void)setModel:(SubModel *)model
{
    _model = model;
    
//    [self.imgView sd_setImageWithURL: [NSURL URLWithString: model.img]];
    self.introLabel.text = self.model.intro;
}
@end
