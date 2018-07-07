//
//  RecentItemCell.m
//  Spotify
//
//  Created by Gokhan Gultekin on 7.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "RecentItemCell.h"

@implementation RecentItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.pictureView.backgroundColor = [UIColor whiteColor];
}

- (void)isRounded:(BOOL)rounded {
    if (rounded) {
        self.pictureView.layer.cornerRadius = self.pictureView.frame.size.width/2;
    } else {
        self.pictureView.layer.cornerRadius = 0;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
