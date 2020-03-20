//
//  PEIAritst+NSJSONSerialization.m
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "PEIAritst+NSJSONSerialization.h"



// Category for JSON Serialization
@implementation PEIArtist (NSJSONSerialization)


// Implement function that was declared in .h
- (instancetype) initWithDictionary: (NSDictionary *)dictionary {
    if (self = [super init]) {
      
        // Creating artistName to access JSON Dictionary value i.e "Coldplay"
        NSString *artistName = [dictionary objectForKey:@"strArtist"];
        
       // Ceating biography to access JSON biography values, if there is no bio "0 string length" then return No info about Artist
        NSString *biography = [dictionary[@"strBiographyEN"] length] > 0 ? [dictionary objectForKey:@"strBiographyEN"] : [NSString stringWithFormat:@"No information about %@", artistName];
        
        // Creating a yearFormed: Int to access the Aritst/ Band year founded
        int yearFormed = (dictionary[@"intFormedYear"] == (id)[NSNull null] ) ? 0 :  [[dictionary objectForKey:@"intFormedYear"] intValue];
    
        // Initialize Object with values found
        self = [self initWithArtistName:artistName biography:biography andFormedYear:yearFormed];
    }
    return self;
}

- (NSDictionary *) artistData {
    
    
    // Creating Dictionary
    NSMutableDictionary *artistData = [NSMutableDictionary dictionary];
    
    // Casting the year formed
    NSString *yearFormed = @(self.formedYear).stringValue;
    
    // Adding key value pairs to dictionary
    [artistData setObject:self.artistName forKey:@"strArtist"];
    [artistData setObject:self.artistBio forKey:@"strBiographyEN"];
    [artistData setObject:yearFormed forKey:@"intFormedYear"];
   
    
    // Creating a dictionary containing entries constructed from the specified set of values and keys
    NSDictionary *artistDataDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.artistName, @"strArtist", self.artistBio, @"strBiographyEN", yearFormed, @"intFormedYear", nil];
    
    return artistDataDictionary;
}



@end
