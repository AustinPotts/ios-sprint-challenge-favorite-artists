//
//  ArtistTableViewController.m
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "PEIArtistTableViewController.h"
#import "PEIArtistDetailViewController.h"
#import "PEIArtist.h"
#import "PEIArtistController.h"

@interface PEIArtistTableViewController ()

// Wrong Array, Use Model COntroller Object Count Similar to Swift 
@property NSMutableArray *tempArtists;
@property PEIArtistController *artistController;

@end

@implementation PEIArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.artistController = [[PEIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad:(BOOL)animated {
    [super viewDidLoad];
     [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[PEIArtistController alloc] init];
      self.artist = [[PEIArtist alloc] init];
    }
    [self.tempArtists removeAllObjects];
    self.tempArtists = [self.artistController artistArray];
    [self.tableView reloadData];
    NSLog(@"Artist controller.artist.count %lu", (unsigned long)self.artistController.artists.count);
}




#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    PEIArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)artist.formedYear];
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
           NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
           PEIArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.controller = self.artistController;
        detailVC.artist = self.artistController.artists[indexPath.row];
       }
       
       if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
           PEIArtistDetailViewController *detailVC = segue.destinationViewController;
           detailVC.controller = self.artistController;
       }
    
    
}


@end
