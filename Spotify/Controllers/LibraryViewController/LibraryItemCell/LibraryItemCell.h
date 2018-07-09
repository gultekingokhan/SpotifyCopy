//
//  LibraryItemCell.h
//  Spotify
//
//  Created by Gokhan Gultekin on 6.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
