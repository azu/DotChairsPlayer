//
// Created by azu on 2014/02/16.
//


#import <Foundation/Foundation.h>


@interface DLListViewTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

- (void)setCurrentDirectoryURL:(NSURL *) url;
@end