#import <Cordova/CDV.h>

#import "NADView.h"
#import "NADInterstitial.h"

@interface CDVNend : CDVPlugin <NADInterstitialDelegate>

- (void)createBanner:(CDVInvokedUrlCommand *)command;
- (void)showBanner:(CDVInvokedUrlCommand *)command;
- (void)hideBanner:(CDVInvokedUrlCommand *)command;
- (void)createInterstitial:(CDVInvokedUrlCommand *)command;
- (void)showInterstitial:(CDVInvokedUrlCommand *)command;

@end
