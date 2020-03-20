//
//  PEIAritst.m
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "PEIAritst.h"

@implementation PEIAritst


//Function Implementation 
-(instancetype)initWithArtistName:(NSString *)name biography:(NSString *)bio andFormedYear:(int)year {
    if (self = [super init]) {
        _artistName = name;
        _artistBio = bio;
        _formedYear = year;
    }
    return self;
}

@end
