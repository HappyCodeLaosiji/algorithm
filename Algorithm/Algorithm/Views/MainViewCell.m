//
//  MainViewCell.m
//  Algorithm
//
//  Created by Neroscofee on 2019/11/26.
//  Copyright © 2019 Pata. All rights reserved.
//

#import "MainViewCell.h"

@interface MainViewCell ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@end

@implementation MainViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.nameLabel];
        [self.backView addSubview:self.authorLabel];
    }
    return self;
}

- (void)setViewContent {
    self.nameLabel.text = self.model.algorithmName;
    self.authorLabel.text = self.model.author;
}

- (void)setModel:(AlgorithmMoreModel *)model {
    _model = model;
    self.nameLabel.text = model.algorithmName;
    self.authorLabel.text = model.author;
//    [self setViewContent];
}

#pragma Lazy Load
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH-30, 70)];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 10;
        _backView.layer.borderWidth = 1;
//        _backView.layer.borderColor = ;
        _backView.layer.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor;
    }
    return _backView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 15, 150, 20)];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return _nameLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-30-94, 40, 70, 15)];
        _authorLabel.textColor = [UIColor blackColor];
        _authorLabel.font = [UIFont systemFontOfSize:12];
        _authorLabel.textAlignment = NSTextAlignmentRight;
    }
    return _authorLabel;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
