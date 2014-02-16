//
// Created by azu on 2014/02/03.
//


#import "AppUITabBarController.h"
#import "AppFactoryAdmin.h"
#import "AppEntryFactory.h"


@implementation AppUITabBarController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabs];
}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
}


- (NSString *)tabItemTitle:(MenuTabType) menuTabType {
    switch (menuTabType) {
        case MenuTab_Main:
            break;
        case MenuTab_DLList:
            break;
    }
    return nil;
}

- (UIImage *)selectedTabItemImage:(MenuTabType) menuTabType {
    switch (menuTabType) {
        case MenuTab_Main:
            break;
        case MenuTab_DLList:
            break;
    }
    return nil;
}

- (UIImage *)unselectedTabItemImage:(MenuTabType) menuTabType {
    switch (menuTabType) {
        case MenuTab_Main:
            break;
        case MenuTab_DLList:
            break;
    }
    return nil;
}

- (void)setupTabs {
    self.viewControllers = @[
        self.appFactoryAdmin.factory.mainNavigationController,
        self.appFactoryAdmin.factory.downloadedNavigationController
    ];
}

- (UITabBarItem *)tabBarItemAtMenuTabType:(MenuTabType) menuTabType {
    NSArray *tabBarItems = [[self tabBar] items];
    UITabBarItem *tabBarItemForType = [tabBarItems objectAtIndex:menuTabType];
    return tabBarItemForType;
}

- (void)setTabBarItem:(UITabBarItem *) tabBarItem tabBarItemSelectedIcon:(UIImage *) tabBarItemSelectedIcon tabBarItemUnselectedIcon:(UIImage *) tabBarItemUnselectedIcon {
    BOOL isSupportRenderingType = [tabBarItemUnselectedIcon respondsToSelector:@selector(imageWithRenderingMode:)];
    UIImage *selectedImage = isSupportRenderingType
                             ? [tabBarItemSelectedIcon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                             : tabBarItemSelectedIcon;
    UIImage *unselectedImage = isSupportRenderingType
                               ? [tabBarItemUnselectedIcon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                               : tabBarItemUnselectedIcon;

    tabBarItem.image = unselectedImage;
    if ([tabBarItem respondsToSelector:@selector(selectedImage)]) {
        [tabBarItem setSelectedImage:selectedImage];
    } else {
        [tabBarItem setFinishedSelectedImage:tabBarItemSelectedIcon withFinishedUnselectedImage:tabBarItemUnselectedIcon];
    }
}
@end