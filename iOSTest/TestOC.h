//
//  TestOC.h
//  iOSTest
//
//  Created by Z on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^JSValueCallback)(NSString*);

@interface JSValue(Uni)
+(JSValue*)valueWithFunction:(JSValueCallback)callback inContext:(JSContext*)ctx;
@end

NS_ASSUME_NONNULL_END
