//
//  PEIAritst+NSJSONSerialization.h
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//




#import "PEIArtist.h"

NS_ASSUME_NONNULL_BEGIN

// Category for JSONSerialization
@interface PEIArtist (NSJSONSerialization)


// Declaration of Dictionary Init
- (instancetype) initWithDictionary: (NSDictionary *)dictionary;

//Declaration of Dictionary called artistData
-(NSDictionary *)artistData;

@end

NS_ASSUME_NONNULL_END
