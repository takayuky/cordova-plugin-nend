# cordova-plugin-nend

This is a cordova plugin, which provides a way to request Nend ads natively from JavaScript.
As of today, only interstitial ad is supported.

## Supported Platforms (and SDK version)

* Android : nendSDK for Android ver2.6.1
* iOS : nendSDK for iOS ver2.7.0

## Installation

```
cordova plugin add com.effers.kaky.nend
```

## Getting Started

```javascript
var options = {};
options.interstitialApiKey = "YOUR_API_KEY";
options.interstitialSpotId = "YOUR_SPOT_ID";

Nend.setOptions(options); // If you don't call this function, a key and an id for testing will be used instead.
Nend.createInterstitial(); // Being invoked in "deviceready" event might be good.

// ...later
Nend.showInterstitial();
```
