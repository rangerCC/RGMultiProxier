//
//  RGProxier.h
//  RGMultiProxier
//
//  Created by TingtingYan on 2018/2/23.
//  Copyright © 2018年 ranger. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RGMultiProxierForProtocol(__protocol__, ...) ((RGProxier <__protocol__> *)[RGProxier multiProxierForProtocol:@protocol(__protocol__) withObjects:((NSArray *)[NSArray arrayWithObjects:__VA_ARGS__,nil])])


@interface RGProxier : NSProxy

@property (nonatomic, strong, readonly) Protocol * protocol;
@property (nonatomic, strong, readonly) NSArray * attachedObjects;

+ (instancetype)multiProxierForProtocol:(Protocol*)protocol withObjects:(NSArray*)objects;

@end
