//
//  TestOC.m
//  iOSTest
//
//  Created by Z on 2024/10/11.
//

#import "TestOC.h"

@implementation JSValue(Uni)
+(JSValue*)valueWithFunction:(JSValueCallback)callback inContext:(JSContext*)ctx{
    return [JSValue valueWithObject:^(NSString*value){
        callback(value);
    } inContext:ctx];
}
@end
