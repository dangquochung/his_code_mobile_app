package com.vnptit.vnpt.homeclinic

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.os.Build
import android.graphics.BitmapFactory
import android.app.ActivityManager
import androidx.core.content.ContextCompat

class WebViewActivity : BaseWebViewActivity() {

    private var initialUrl: String? = null
    private var bundleId: String? = null
    private var iconUrl: String? = null
    private var title: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent(intent)
        window.statusBarColor = ContextCompat.getColor(this, R.color.status_bar_blue)
    }

    override fun onDestroy() {
        super.onDestroy()
        val bundleId = intent.getStringExtra("bundleId")
        bundleId?.let {
            MainActivity.openedBundles.remove(it)
            Log.d("WebViewActivity", "Removed bundle $it from openedBundles")
        }
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?) {
        val newUrl = intent?.getStringExtra("url")
        bundleId = intent?.getStringExtra("bundleId")
        iconUrl = intent?.getStringExtra("iconUrl")
        title = intent?.getStringExtra("title")
        
        Log.d("WebActivity", "Received URL: $newUrl, Bundle ID: $bundleId, IconURL: $iconUrl, Title: $title")
        
        if (newUrl.isNullOrEmpty() || bundleId.isNullOrEmpty()) {
            Log.e("WebViewActivity", "Invalid URL or Bundle ID")
            finish()
            return
        }
        
        // Cập nhật title ngay sau khi nhận được
        title?.let {
            updateAppBarTitle(it)
        }
        
        webView.stopLoading()
        webView.clearCache(false)
        webView.loadUrl(newUrl)
        Log.d("WebViewActivity", "Loaded URL: $newUrl for Bundle ID: $bundleId")
    }

    override fun onResume() {
        super.onResume()
        
        // Cập nhật title
        title?.let {
            updateAppBarTitle(it)
        }
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val taskDescription = ActivityManager.TaskDescription(
                getAppBarTitle()
            )
            setTaskDescription(taskDescription)
        }
        
        if (initialUrl != null && webView.url != initialUrl) {
            webView.stopLoading()
            webView.clearCache(false)
            webView.loadUrl(initialUrl!!)
            webView.reload()
            Log.d("WebViewActivity", "Reloaded URL: $initialUrl on onResume")
        }
    }

    override fun getAppBarTitle(): String {
        return title ?: "Tiêu đề mặc định"
    }

    override fun getInitialUrl(): String {
        return initialUrl ?: ""
    }
}