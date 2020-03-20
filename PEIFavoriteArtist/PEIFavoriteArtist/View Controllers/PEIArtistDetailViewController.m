//
//  ArtistDetailViewController.m
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "PEIArtistDetailViewController.h"
#import "PEIArtistController.h"
#import "PEIArtist.h"
#import "PEIAritst+NSJSONSerialization.h"


@interface PEIArtistDetailViewController ()

// Outlets 
@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation PEIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _artistSearchBar.delegate = self;
    [self updateViews];
}



-(void)saveArtist:(PEIArtist *)artistRetrieved {
    if (artistRetrieved) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artistRetrieved artistData] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artistName] URLByAppendingPathExtension:@"json"];
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving artist");
        return;
    }
    return;
}

//Configure logic for this in helper fucntion
- (IBAction)saveButtonTapped:(id)sender {
    if (self.artist) {
           [self saveArtist:self.artist];
           [self.navigationController popToRootViewControllerAnimated:true];
       } else {
           NSLog(@"Invalid Artist");
       }
}

-(void)updateViews {
    if (!self.isViewLoaded || !self.artist) {return;}
    self.artistName.text = self.artist.artistName;
    self.bioTextView.text = self.artist.artistBio;
    self.yearFormed.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.artist.formedYear];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.artistName.text = [NSString stringWithFormat:@" Fetching %@", searchBar.text];
    
  [self.controller fetchArtistWithName:searchBar.text completionBlock:^(PEIArtist *receivedArtist, NSError *error) {
        if (error) {
            NSLog(@"Unable to fetch");
             dispatch_async(dispatch_get_main_queue(), ^{
            self.artistName.text = @"The artist you entered is not available";
             });
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artist = receivedArtist;
                [self updateViews];
                
            });
        }
    }];
}

@end
