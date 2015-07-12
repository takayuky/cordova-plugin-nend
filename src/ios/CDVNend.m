#import "CDVNend.h"

@implementation CDVNend

- (void)createInterstitial:(CDVInvokedUrlCommand *)command {
    NSLog(@"createInterstitial");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    [[NADInterstitial sharedInstance] loadAdWithApiKey:@"308c2499c75c4a192f03c02b2fcebd16dcb45cc9"
                                                spotId:@"213208"];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)showInterstitial:(CDVInvokedUrlCommand *)command {
    NSLog(@"showInterstitial");

    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;

    NADInterstitialShowResult result = [[NADInterstitial sharedInstance] showAd];
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
