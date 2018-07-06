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

@interface LibraryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * objects;
@property (strong, nonatomic) Parser * parser;

@end

@implementation LibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.parser = [[Parser alloc] init];
    NSLog(@"PARSED DATA:%@", [self.parser data]);
    
    UINib * nib = [UINib nibWithNibName:@"LibraryItemCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"LibraryItemCell"];
    
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.parser data] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LibraryItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LibraryItemCell" forIndexPath:indexPath];
    
    NSString * text = [[[self.parser data] objectAtIndex:indexPath.row] objectForKey:@"text"];
    NSString * icon = [[[self.parser data] objectAtIndex:indexPath.row] objectForKey:@"icon"];
    cell.titleLabel.text = text;
    cell.iconView.image = [UIImage imageNamed:icon];
    
    return cell;
}





@end
