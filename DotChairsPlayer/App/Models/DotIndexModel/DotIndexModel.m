//
//  DotIndexModel.m
//
//  Created by   on 2014/02/16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "DotIndexModel.h"


NSString *const kDotIndexModelTitle = @"title";
NSString *const kDotIndexModelUrl = @"url";
NSString *const kDotIndexModelVideoID = @"videoID";


@interface DotIndexModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DotIndexModel

@synthesize title = _title;
@synthesize url = _url;
@synthesize videoID = _videoID;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.title = [self objectOrNilForKey:kDotIndexModelTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kDotIndexModelUrl fromDictionary:dict];
            self.videoID = [self objectOrNilForKey:kDotIndexModelVideoID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kDotIndexModelTitle];
    [mutableDict setValue:self.url forKey:kDotIndexModelUrl];
    [mutableDict setValue:self.videoID forKey:kDotIndexModelVideoID];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.title = [aDecoder decodeObjectForKey:kDotIndexModelTitle];
    self.url = [aDecoder decodeObjectForKey:kDotIndexModelUrl];
    self.videoID = [aDecoder decodeObjectForKey:kDotIndexModelVideoID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kDotIndexModelTitle];
    [aCoder encodeObject:_url forKey:kDotIndexModelUrl];
    [aCoder encodeObject:_videoID forKey:kDotIndexModelVideoID];
}

- (id)copyWithZone:(NSZone *)zone
{
    DotIndexModel *copy = [[DotIndexModel alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.videoID = [self.videoID copyWithZone:zone];
    }
    
    return copy;
}


@end
