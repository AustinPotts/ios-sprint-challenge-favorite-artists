//
//  PEIArtistController.m
//  PEIFavoriteArtist
//
//  Created by Austin Potts on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "PEIArtistController.h"
#import "PEIArtist.h"
#import "PEIAritst+NSJSONSerialization.h"


@interface PEIArtistController()

@end

@implementation PEIArtistController


// Creating Base URL for API
static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?=";

-(instancetype)init {
    self = [super init];
    if (self) {
        
       // Muatbale array of artist
        _artists = [@[] mutableCopy];
    }
    return self;
}


// Calling Declared Function to fecth artist
-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(PEIArtistControllerCompletionBlock)completionBlock {
    
    // Building URL Components
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[ [NSURLQueryItem queryItemWithName:@"s" value:artistName] ];
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    
    //URLSession.shared.dataTask (Swift Version)
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Error HAndling
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // JSON Error Handling
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        NSArray *jsonDictionary = json[@"artists"];
        
        // Checking if we have values, if so then Init with Dictionary
        if (jsonDictionary != (id) [NSNull null]){
            PEIArtist *artist = [[PEIArtist alloc] initWithDictionary:jsonDictionary[0]];
            
            // You only want an object added when you hit the save button
           // [self.artists  addObject:artist];
            completionBlock(artist, nil);
        }
        NSLog(@"error: %@", error);
        
        // ERROR: This completion block returns nil instead of artist 
       // completionBlock(nil, error);
    }];
    [task resume];
}

// Calling Declared function to add a new Artist
-(void)addArtistWithName:(NSString *)name
               artistBio:(NSString *)bio
              formedYear:(int)year {
    //Add new artist
    PEIArtist *artist = [[PEIArtist alloc] initWithArtistName:name
                                                    biography:bio andFormedYear:year];
    [self.artists addObject:artist];
 
}

// Calling Declared fucntion to update the Artist added
-(void)update:(PEIArtist *)artist
withArtistName:(NSString *)name
    biography:(NSString *)bio
   formedYear:(int)year {
    
    artist.artistName = name;
    artist.artistBio = bio;
    artist.formedYear = year;
    
}


// get the object at the proper index
-(PEIArtist *)objectAtIndex:(NSUInteger)index {
    return [self.artists objectAtIndex: index];
}

// File Manager to persist data
-(NSMutableArray *)artistArray {
    
    // Create list of directory search paths.
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    // shared file manager
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    
    // Look for artist in file path provided
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        // Return a newly created NSURL
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            PEIArtist *artist = [[PEIArtist alloc] initWithDictionary:artistDictionary];
            [self.artists addObject:artist];
        } else {
            NSLog(@"Artist is nil");
        }
        
    }
    return self.artists;
}




@end
