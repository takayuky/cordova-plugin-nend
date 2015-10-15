
var nendExport = {};
var options = {};

var defaultOptions = {
  bannerApiKey: "a6eca9dd074372c898dd1df549301f277c53f2b9",
  bannerSpotId: "3172",
  bannerWidth: 320,
  bannerHeight: 50,
  bannerBackgroundColor: "0xFFFFFF",
  interstitialApiKey: "308c2499c75c4a192f03c02b2fcebd16dcb45cc9",
  interstitialSpotId: "213208"
};

nendExport.setOptions = function(args) {
    options = args;
};

nendExport.createBanner = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'createBanner',
    [sendOptions()]
  );
};

nendExport.showBanner = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'showBanner',
    [sendOptions()]
  );
};

nendExport.hideBanner = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'hideBanner',
    [sendOptions()]
  );
};

nendExport.createInterstitial = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'createInterstitial',
    [sendOptions()]
  );
};

nendExport.showInterstitial = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'showInterstitial',
    []
  );
};

var sendOptions = function() {
  returnObj = {};
  for (var attr in defaultOptions) {
    returnObj[attr] = options[attr] || defaultOptions[attr];
  }
  return returnObj;
};

module.exports = nendExport;
