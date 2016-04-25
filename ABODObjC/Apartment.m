//
//  Apartment.m
//  ABODObjC
//
//  Created by Kawika Avilla on 4/24/16.
//  Copyright © 2016 kawikaavilla. All rights reserved.
//

#import "Apartment.h"

@implementation Apartment

- (instancetype)initWithName:(NSString*)propertyName
                  priceRange:(NSString*)priceRange
                    bedRange:(NSString*)bedRange
                     tileUrl:(NSString*)tileUrl
{
    self = [super init];
    if (self) {
        _propertyName = [propertyName copy];
        _priceRange = [priceRange copy];
        _bedRange = [bedRange copy];
        _tileUrl = [tileUrl copy];
    }
    return self;
}

@end
