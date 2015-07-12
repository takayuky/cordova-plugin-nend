#import <Cordova/CDV.h>

#import "NADInterstitial.h"

@interface CDVNend : CDVPlugin <NADInterstitialDelegate>

- (void)createInterstitial:(CDVInvokedUrlCommand *)command;
- (void)showInterstitial:(CDVInvokedUrlCommand *)command;

@end
