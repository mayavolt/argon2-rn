#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNArgon2, NSObject)

RCT_EXTERN_METHOD(verify: (NSString *)hash password:(NSString *)password resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(hash: (NSString *)password salt:(NSString *)salt config:(NSDictionary *)config resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
