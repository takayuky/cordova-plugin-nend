package com.effers.kaky.nend;

import org.apache.cordova.*;
import net.nend.android.NendAdInterstitial;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Activity;

public class Nend extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray inputs, final CallbackContext callbackContext) throws JSONException {
        PluginResult result = null;
        final Activity activity = cordova.getActivity();

        if (action.equals("createInterstitial")) {
            JSONObject options = inputs.optJSONObject(0);
            NendAdInterstitial.loadAd(
                activity.getApplicationContext(),
                options.getString("interstitialApiKey"),
                options.getInt("interstitialSpotId")
            );
            callbackContext.success();

        } else if (action.equals("showInterstitial")) {
            activity.runOnUiThread(new Runnable() {
                public void run() {
                    NendAdInterstitial.showAd(activity);
                    callbackContext.success();
                }
            });

        }

        if(result != null) callbackContext.sendPluginResult( result );
        return true;
    }
}
