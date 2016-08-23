#import "CDVNend.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CDVNend ()

@property (strong) UIView *bannerView;

@end

@implementation CDVNend

- (void)createBanner:(CDVInvokedUrlCommand *)command {
    NSLog(@"createBanner");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    NSDictionary* options = [command argumentAtIndex:0 withDefault:[NSNull null]];

    int bannerWidth = [[options objectForKey:@"bannerWidth"] intValue];
    int bannerHeight = [[options objectForKey:@"bannerHeight"] intValue];

    CGRect sf = self.webView.superview.bounds;

    int originX = (sf.size.width - bannerWidth) / 2;
    int originY = sf.size.height - bannerHeight;

    NSLog(@"API Key: %@", [options objectForKey:@"bannerApiKey"]);
    NSLog(@"Spot ID: %@", [options objectForKey:@"bannerSpotId"]);

    NADView *nadView =  [[NADView alloc] initWithFrame:CGRectMake(originX, 0, bannerWidth, bannerHeight)];
    [nadView setNendID:[options objectForKey:@"bannerApiKey"] spotID:[options objectForKey:@"bannerSpotId"]];
    [nadView load];

    UIView *bannerContainerView =
        [[UIView alloc] initWithFrame:CGRectMake(0, originY, sf.size.width, 50)];

    unsigned colorInt;
    [[NSScanner scannerWithString:[options objectForKey:@"bannerBackgroundColor"]] scanHexInt:&colorInt];
    bannerContainerView.backgroundColor = UIColorFromRGB(colorInt);

    [bannerContainerView addSubview:nadView];
    self.bannerView = bannerContainerView;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)showBanner:(CDVInvokedUrlCommand *)command {
    NSLog(@"showBanner");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    CGRect wf = self.webView.frame;
    wf.size.height = self.webView.superview.bounds.size.height - 50;
    self.webView.frame = wf;

    [self.webView.superview addSubview:self.bannerView];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)hideBanner:(CDVInvokedUrlCommand *)command {
    NSLog(@"hideBanner");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    CGRect wf = self.webView.frame;
    wf.size.height = self.webView.superview.bounds.size.height;
    self.webView.frame = wf;

    [self.bannerView removeFromSuperview];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)createInterstitial:(CDVInvokedUrlCommand *)command {
    NSLog(@"createInterstitial");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    NSDictionary* options = [command argumentAtIndex:0 withDefault:[NSNull null]];

    [[NADInterstitial sharedInstance] loadAdWithApiKey:[options objectForKey:@"interstitialApiKey"]
                                                spotId:[options objectForKey:@"interstitialSpotId"]];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)showInterstitial:(CDVInvokedUrlCommand *)command {
    NSLog(@"showInterstitial");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    NADInterstitialShowResult result = [[NADInterstitial sharedInstance] showAdFromViewController: self.viewController];
    switch ( result )
    {
        case AD_SHOW_SUCCESS:
            NSLog(@"広告の表示に成功しました。");
            break;
        case AD_SHOW_ALREADY:
            NSLog(@"既に広告が表示されています。");
            break;
        case AD_FREQUENCY_NOT_REACHABLE:
            NSLog(@"広告のフリークエンシーカウントに達していません。");
            break;
        case AD_LOAD_INCOMPLETE:
            NSLog(@"抽選リクエストが実行されていない、もしくは実行中です。");
            break;
        case AD_REQUEST_INCOMPLETE:
            NSLog(@"抽選リクエストに失敗しています。");
            break;
        case AD_DOWNLOAD_INCOMPLETE:
            NSLog(@"広告のダウンロードが完了していません。");
            break;
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
