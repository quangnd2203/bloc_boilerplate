package com.quangnd.bloc_boilerplate
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

//Enable this line if use zalo login
//import com.zing.zalo.zalosdk.oauth.ZaloSDK


class MainActivity : FlutterActivity() {
//    Enable this line if use zalo login
//    override fun onActivityResult(requestCode:Int, resultCode:Int, data:Intent?) {
//        super.onActivityResult(requestCode, resultCode, data)
//        ZaloSDK.Instance.onActivityResult(this, requestCode, resultCode, data)
//    }
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor").setMethodCallHandler {
                call, result -> result.success(BuildConfig.FLAVOR)
        }
    }
}

