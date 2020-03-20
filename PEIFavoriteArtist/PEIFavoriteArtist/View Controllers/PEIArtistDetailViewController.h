//
//  ArtistDetailViewController.h
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PEIArtistController;
@class PEIArtist;

@interface PEIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property PEIArtistController *controller;
@property PEIArtist *artist;

@end

NS_ASSUME_NONNULL_END
