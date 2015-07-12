
var nendExport = {};

nendExport.createInterstitial = function(successCallback, failureCallback) {
  cordova.exec(
    successCallback,
    failureCallback,
    'Nend',
    'createInterstitial',
    []
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

module.exports = nendExport;
