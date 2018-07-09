//
//  RecentItemCell.h
//  Spotify
//
//  Created by Gokhan Gultekin on 7.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

- (void)isRounded:(BOOL)rounded;

@end
