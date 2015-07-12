
var nendExport = {};
var options = {};

var defaultOptions = {
  interstitialApiKey: "308c2499c75c4a192f03c02b2fcebd16dcb45cc9",
  interstitialSpotId: "213208"
};

nendExport.setOptions = function(args) {
    options = args;
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
