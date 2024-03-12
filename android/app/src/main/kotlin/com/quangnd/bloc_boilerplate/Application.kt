package com.quangnd.bloc_boilerplate
import io.flutter.app.FlutterApplication
//Enable this line if use zalo login
//import com.zing.zalo.zalosdk.oauth.ZaloSDKApplication

class Application : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
//        Enable this line if use zalo login
//        ZaloSDKApplication.wrap(this);
    }
}