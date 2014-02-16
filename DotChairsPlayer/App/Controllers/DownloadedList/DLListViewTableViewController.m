//
// Created by azu on 2014/02/16.
//


#import <MediaPlayer/MediaPlayer.h>
#import "DLListViewTableViewController.h"
#import "DLViewTableViewModel.h"


@interface DLListViewTableViewController ()
@property(nonatomic, strong) DLViewTableViewModel *model;
@property(nonatomic, strong) UIDocumentInteractionController *interactionController;
@end

@implementation DLListViewTableViewController
- (DLViewTableViewModel *)model {
    if (_model == nil) {
        _model = [[DLViewTableViewModel alloc] init];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    [self updateTable];
}

- (void)updateTable {
    [self.model reloadData];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return [self.model numberOfData];
}

- (void)updateCell:(UITableViewCell *) cell atIndexPath:(NSIndexPath *) indexPath {
    cell.textLabel.text = [self.model fileNameAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *) tableView
         cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Update Cell
    [self updateCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model deleteFileAtIndexPath:indexPath];
        [self updateTable];
    }
}

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    NSURL *filePathURL = [self.model filePathURLAtIndexPath:indexPath];
    MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:filePathURL];
    [self presentViewController:mp animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *) indexPath {
    NSURL *filePathURL = [self.model filePathURLAtIndexPath:indexPath];
    self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:filePathURL];
    [self.interactionController presentOpenInMenuFromRect:CGRectMake(0, 0,
        320,
        320) inView:self.view animated:YES];
}

@end