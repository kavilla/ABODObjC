//
//  Apartment.h
//  ABODObjC
//
//  Apartment object that has a price range, bedrange, property name, and
//  url that points to the image of the property
//
//  Created by Kawika Avilla on 4/24/16.
//  Copyright © 2016 kawikaavilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Apartment : NSObject

@property (nonatomic,readonly) NSString* priceRange;
@property (nonatomic,readonly) NSString* bedRange;
@property (nonatomic,readonly) NSString* propertyName;
@property (nonatomic,readonly) NSString* tileUrl;

- (instancetype)initWithName:(NSString*)propertyName
                  priceRange:(NSString*)priceRange
                    bedRange:(NSString*)bedRange
                     tileUrl:(NSString*)tileUrl;

@end
