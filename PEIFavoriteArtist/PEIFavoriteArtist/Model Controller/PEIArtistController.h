//
//  PEIArtistController.h
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEIArtist.h"


NS_ASSUME_NONNULL_BEGIN

// Type Alias for Completion Block DRY
typedef void (^PEIArtistControllerCompletionBlock)(PEIArtist *, NSError *);
@class PEIArtist;


@interface PEIArtistController : NSObject


// Declaration of fetch function to retrieve artist
-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(PEIArtistControllerCompletionBlock)completionBlock;


// Property - Array of artists
@property NSMutableArray *artists;


//object at index
-(PEIArtist *)objectAtIndex:(NSUInteger)index;


// Add a new artist
-(void)addArtistWithName:(NSString *)name
              artistBio:(NSString *)bio
              formedYear:(int)year;


// Update the Artist
-(void)update:(PEIArtist *)artist
withArtistName:(NSString *)name
biography:(NSString *)bio
   formedYear:(int)year;



- (NSMutableArray *)artistArray;


@end

NS_ASSUME_NONNULL_END
