//
//  PEIAritst.h
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PEIArtist;
@interface PEIArtist : NSObject

//Properties 
@property NSString *artistName;
@property NSString *artistBio;
@property int formedYear;

// Method Declaration for Init of Artist
-(instancetype)initWithArtistName:(NSString *)name
biography:(NSString *)bio
                    andFormedYear:(int)year;

@end

NS_ASSUME_NONNULL_END
