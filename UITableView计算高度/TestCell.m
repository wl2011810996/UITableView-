//
//  TestCell.m
//  UITableView计算高度
//
//  Created by 荣耀iMac on 16/9/19.
//  Copyright © 2016年 wleleven. All rights reserved.
//

#import "TestCell.h"
#import "TestModel.h"

@interface TestCell()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *contentLabel;
@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;


@end

@implementation TestCell

-(void)setModel:(TestModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.contentImageView.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.usernameLabel.text = model.username;
    self.timeLabel.text = model.time;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contentLabel sizeThatFits:size].height;
    totalHeight += [self.contentImageView sizeThatFits:size].height;
    totalHeight += [self.usernameLabel sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}

@end
