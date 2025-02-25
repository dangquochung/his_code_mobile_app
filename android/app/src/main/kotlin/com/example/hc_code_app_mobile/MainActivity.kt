package com.vnptit.vnpt.homeclinic

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "com.vnptit.vnpt.homeclinic/webview"
    companion object {
        val openedBundles = mutableMapOf<String, Intent>() // Truy cập được từ các Activity khác
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openWebView") {
                val url = call.argument<String>("url")
                val bundleId = call.argument<String>("bundleId")
                var iconUrl = call.argument<String>("iconUrl")
                var title = call.argument<String>("title")
                Log.d("MainActivity", "Received URL: $url, Bundle ID: $bundleId, IconURL: $iconUrl, Title: $title")
                if (url != null && bundleId != null) {
                    openWebView(bundleId, url, iconUrl, title)
                    result.success(null)
                } else {
                    Log.d("MainActivity", "Received URL: $url, Bundle ID: $bundleId")
                    result.error("INVALID_ARGUMENT", "URL hoặc Bundle ID không hợp lệ", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openWebView(bundleId: String, url: String, iconUrl: String?, title: String?) {
        // Kiểm tra nếu mini app với bundleId đã có instance mở trước đó
        val existingIntent = MainActivity.openedBundles[bundleId]
        if (existingIntent != null) {
            // Đưa instance đã mở lên foreground
            existingIntent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            Log.d("MainActivity", "Bundle $bundleId đã mở, đưa Activity lên front.")
            startActivity(existingIntent)
        } else {
            // Nếu chưa có, tạo Intent mới cho mini app này
            Log.d("MainActivity", "Mở mini app mới $bundleId với URL: $url.")
            val intent = Intent(this, WebViewActivity::class.java).apply {
                putExtra("url", url)
                putExtra("bundleId", bundleId)
                putExtra("iconUrl", iconUrl)
                putExtra("title", title)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            openedBundles[bundleId] = intent
            startActivity(intent)
        }
    }
}