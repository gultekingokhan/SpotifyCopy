//
//  SPNavigationController.m
//  Spotify
//
//  Created by Gokhan Gultekin on 5.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "SPNavigationController.h"
#import "UIColor+Category.h"

@interface SPNavigationController ()

@end

@implementation SPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.barTintColor = [UIColor navigationBarBarTintColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor navigationBarTintColor]};

}

@end
