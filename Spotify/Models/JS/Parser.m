//
//  Parser.m
//  Spotify
//
//  Created by Gokhan Gultekin on 6.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "Parser.h"

@implementation Parser

- (NSArray*)data {
    NSDictionary *dict = [self readJsonFromFile];
    NSArray *library = [dict objectForKey:@"library"];
    return library;
}

- (NSDictionary *)readJsonFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
