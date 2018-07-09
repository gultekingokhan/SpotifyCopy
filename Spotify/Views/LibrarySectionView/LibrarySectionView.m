//
//  LibrarySectionView.m
//  Spotify
//
//  Created by Gokhan Gultekin on 7.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "LibrarySectionView.h"
#import "UIColor+Category.h"

@implementation LibrarySectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor viewBackgroundColor];
        
        /*ADD RECENTLY PLAYED LABEL*/
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = @"Recently Played";
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:titleLabel];
        
        /*SETUP CONSTRAINTS FOR TITLELABEL*/
        [titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:14.0].active = YES;
        [titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-14.0].active = NO;
        [titleLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8.0].active = YES;
        [titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:8].active = YES;

        /*ADD EDIT BUTTON*/
        UIButton * editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        editButton.frame = CGRectZero;
        [editButton setTitle:@"EDIT" forState:UIControlStateNormal];
        editButton.titleLabel.textColor = [UIColor whiteColor];
        editButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:editButton];
        
        /*SETUP CONSTRAINTS FOR EDIT BUTTON*/
        [editButton.widthAnchor constraintEqualToConstant:40].active = YES;
        [editButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20.0].active = YES;
        [editButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8.0].active = YES;
        [editButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:8].active = YES;

        /*SETUP CONSTRAINTS FOR RELATIONSHIP BETWEEN TITLE LABEL AND THE EDIT BUTTON*/
        [titleLabel.trailingAnchor constraintEqualToAnchor:editButton.leadingAnchor constant:-14.0].active = YES;
        [editButton.leadingAnchor constraintEqualToAnchor:titleLabel.trailingAnchor constant:14.0].active = YES;

    }
    
    return self;
}

@end
