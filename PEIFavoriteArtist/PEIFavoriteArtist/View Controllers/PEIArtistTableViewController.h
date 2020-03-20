//
//  ArtistTableViewController.h
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PEIArtistController;
@class PEIArtist;

@interface PEIArtistTableViewController : UITableViewController

@property PEIArtist *artist;
@property (nonatomic)PEIArtistController *controller;



@end

NS_ASSUME_NONNULL_END
