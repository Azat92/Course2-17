//
//  BooksTableViewController.m
//  Lesson17
//
//  Created by Azat Almeev on 13.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "BooksTableViewController.h"
#import "Book.h"

@interface BooksTableViewController () <UISearchResultsUpdating>
@property (nonatomic, readonly) NSArray *books;
@property (nonatomic, readonly) UISearchController *searchController;
@end

@implementation BooksTableViewController
@synthesize books = _books;
@synthesize searchController = _searchController;

- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
    }
    return _searchController;
}

- (NSArray *)books {
    if (!_books)
        _books = [self.dbWorker booksArrayUsingQuery:[NSString stringWithFormat:@"%@*", self.searchController.searchBar.text]];
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
}

#pragma mark - Search results updates
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    _books = nil;
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BookCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    id <BookProtocol> book = self.books[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@. %@", book.uid, book.work];
    cell.detailTextLabel.text = book.author;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
