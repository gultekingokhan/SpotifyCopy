//
//  SPTabBarController.m
//  Spotify
//
//  Created by Gokhan Gultekin on 5.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "SPTabBarController.h"
#import "UIColor+Category.h"

#import "HomeViewController.h"
#import "SPNavigationController.h"
#import "LibraryViewController.h"
#import "RadioViewController.h"
#import "SearchViewController.h"
#import "BrowseViewController.h"
#import "HomeViewController.h"

@interface SPTabBarController ()

@end

@implementation SPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [UIColor tabBarBarTintColor];
    self.tabBar.tintColor = [UIColor tabBarTintColor];

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewControllers = [self controllers];
    }
    return self;
}

- (SPNavigationController*) setupController:(id)controller title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage {
    
    SPNavigationController * navigationController = [[SPNavigationController alloc] initWithRootViewController:controller];
    [controller setTitle:title];
    UITabBarItem * homeItem = [[UITabBarItem alloc] initWithTitle:title
                                                            image:[UIImage imageNamed:image]
                                                    selectedImage:[UIImage imageNamed:selectedImage]];
    [navigationController setTabBarItem:homeItem];
    
    return navigationController;
}

- (NSArray*) controllers {
    
    HomeViewController * homeVC         = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    BrowseViewController * browseVC     = [[BrowseViewController alloc] initWithNibName:@"BrowseViewController" bundle:nil];
    SearchViewController * searchVC     = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    RadioViewController * radioVC       = [[RadioViewController alloc] initWithNibName:@"RadioViewController" bundle:nil];
    LibraryViewController * libraryVC   = [[LibraryViewController alloc] initWithNibName:@"LibraryViewController" bundle:nil];
    
    return @[[self setupController:homeVC title:@"Home" image:@"tab_home" selectedImage:@"tab_home_s"],
             [self setupController:browseVC title:@"Browse" image:@"tab_browse" selectedImage:@"tab_browse_s"],
             [self setupController:searchVC title:@"Search" image:@"tab_search" selectedImage:@"tab_search_s"],
             [self setupController:radioVC title:@"Radio" image:@"tab_radio_s" selectedImage:@"tab_radio_s"],
             [self setupController:libraryVC title:@"Library" image:@"tab_library" selectedImage:@"tab_library_s"]];
}

@end
