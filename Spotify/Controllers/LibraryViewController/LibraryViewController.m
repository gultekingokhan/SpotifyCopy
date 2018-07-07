//
//  LibraryViewController.m
//  Spotify
//
//  Created by Gokhan Gultekin on 5.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "LibraryViewController.h"
#import "LibraryItemCell.h"
#import "Parser.h"
#import "LibrarySectionView.h"
#import "UIColor+Category.h"
#import "RecentItemCell.h"

@interface LibraryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * objects;
@property (strong, nonatomic) Parser * parser;

@end

@implementation LibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.parser = [[Parser alloc] init];

    [self registerCell:@"LibraryItemCell"];
    [self registerCell:@"RecentItemCell"];

    self.tableView.sectionHeaderHeight = 34;

}

- (void) registerCell:(NSString*)nibName {
    UINib * nib = [UINib nibWithNibName:nibName bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:nibName];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return tableView.sectionHeaderHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LibrarySectionView * sectionView = [[LibrarySectionView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, self.tableView.sectionHeaderHeight)];
    return sectionView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [[self.parser dataFromKey:@"library"] count];
            break;
        case 1:
            return [[self.parser dataFromKey:@"recently_played"] count];
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0: {
            
            LibraryItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LibraryItemCell" forIndexPath:indexPath];

            NSDictionary * data = [[self.parser dataFromKey:@"library"] objectAtIndex:indexPath.row];
            
            NSString * text = [data objectForKey:@"text"];
            NSString * icon = [data objectForKey:@"icon"];
            cell.titleLabel.text = text;
            cell.iconView.image = [UIImage imageNamed:icon];
            
            return cell;
        } break;
        case 1: {
            
            RecentItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RecentItemCell" forIndexPath:indexPath];
            
            NSArray * dataArray = [self.parser dataFromKey:@"recently_played"];
            NSDictionary * data = [dataArray objectAtIndex:indexPath.row];
            NSString * type = [data objectForKey:@"type"];
            
            if ([type isEqualToString:@"album"]) {
                [cell isRounded:false];
                cell.itemLabel.text = [data objectForKey:@"name"];
                cell.detailLabel.text = [NSString stringWithFormat:@"Album・by %@", [data objectForKey:@"owner"]];
            } else if ([type isEqualToString:@"artist"]) {
                [cell isRounded:true];
                cell.itemLabel.text = [data objectForKey:@"name"];
                cell.detailLabel.text = @"Artist";
            } else {
                [cell isRounded:false];
                //playlist
                cell.itemLabel.text = [data objectForKey:@"name"];
                cell.detailLabel.text = [NSString stringWithFormat:@"Playlist・by %@", [data objectForKey:@"owner"]];
            }
      
            return cell;
        } break;
        default:
            break;
    }
    return nil;
}

@end
