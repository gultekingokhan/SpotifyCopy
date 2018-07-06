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

- (SPNavigationController*) setupControllerWithNibName:(NSString*)nibName title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage {
    
    SPViewController * viewController = [[SPViewController alloc] initWithNibName:nibName bundle:nil];
    SPNavigationController * navigationController = [[SPNavigationController alloc] initWithRootViewController:viewController];
    viewController.title = title;
    UITabBarItem * homeItem = [[UITabBarItem alloc] initWithTitle:title
                                                            image:[UIImage imageNamed:image]
                                                    selectedImage:[UIImage imageNamed:selectedImage]];
    [navigationController setTabBarItem:homeItem];
    
    return navigationController;
}

- (NSArray*) controllers {
    
    return @[[self setupControllerWithNibName:@"HomeViewController" title:@"Home" image:@"tab_home" selectedImage:@"tab_home_s"],
             [self setupControllerWithNibName:@"BrowseViewController" title:@"Browse" image:@"tab_browse" selectedImage:@"tab_browse_s"],
             [self setupControllerWithNibName:@"SearchViewController" title:@"Search" image:@"tab_search" selectedImage:@"tab_search_s"],
             [self setupControllerWithNibName:@"RadioViewController" title:@"Radio" image:@"tab_radio_s" selectedImage:@"tab_radio_s"],
             [self setupControllerWithNibName:@"LibraryViewController" title:@"Library" image:@"tab_library" selectedImage:@"tab_library_s"]];
}



@end
