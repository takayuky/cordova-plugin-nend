# cordova-plugin-nend

This is a cordova plugin, which provides a way to request Nend ads natively from JavaScript.

## Supported Platforms (and SDK version)

* Android : nendSDK for Android ver2.6.1
* iOS : nendSDK for iOS ver2.7.0

## Installation

```
cordova plugin add com.effers.kaky.nend
```

## Getting Started

### Banner Ad (only iOS is supported)

```javascript
var options = {};
options.bannerApiKey = "YOUR_API_KEY";
options.bannerSpotId = "YOUR_SPOT_ID";
options.bannerWidth = 300; // optional (default: 320)
options.bannerHeight = 250; // optional (default: 50)
options.bannerBackgroundColor = "0x6096C3"; // background color for banner view (default: "0xFFFFFF")

Nend.setOptions(options); // If you don't call this function, a key and an id for testing will be used instead.
Nend.createBanner(); // Being invoked in "deviceready" event might be good.

// ...later
Nend.showBanner();

// if you wanna hide existing banner
Nend.hideBanner();
```

### Interstitial Ad (both iOS and Android are supported)

```javascript
var options = {};
options.interstitialApiKey = "YOUR_API_KEY";
options.interstitialSpotId = "YOUR_SPOT_ID";

Nend.setOptions(options); // If you don't call this function, a key and an id for testing will be used instead.
Nend.createInterstitial(); // Being invoked in "deviceready" event might be good.

// ...later
Nend.showInterstitial();
```
