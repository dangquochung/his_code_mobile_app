package com.vnptit.vnpt.homeclinic

import android.graphics.Bitmap
import android.os.Bundle
import android.util.Log
import android.view.View
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.airbnb.lottie.LottieAnimationView
import com.google.android.material.appbar.MaterialToolbar

abstract class BaseWebViewActivity : AppCompatActivity() {

    protected lateinit var webView: WebView
    private lateinit var loadingAnim: LottieAnimationView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_base_webview)
        window.statusBarColor = ContextCompat.getColor(this, R.color.status_bar_blue)
        setupAppBar()
        setupWebView()
    }

    protected fun updateAppBarTitle(newTitle: String) {
        val toolbar: MaterialToolbar = findViewById(R.id.customAppBar)
        toolbar.title = newTitle
    }

    private fun setupAppBar() {
        val toolbar: MaterialToolbar = findViewById(R.id.customAppBar)
        toolbar.title = getAppBarTitle()
        toolbar.isTitleCentered = true
        toolbar.setNavigationIcon(R.drawable.ic_close)
        toolbar.setNavigationOnClickListener {
            finishAndRemoveTask()
        }

        toolbar.setOnMenuItemClickListener { item ->
            when (item.itemId) {
                R.id.action_reload -> {
                    webView.reload()
                    true
                }
                R.id.action_webview_menu -> {
                    showBottomSheet()
                    true
                }
                else -> false
            }
        }
    }

    private fun setupWebView() {
        loadingAnim = findViewById(R.id.loadingAnim)
        webView = findViewById(R.id.webView)
        webView.settings.apply {
            javaScriptEnabled = true
            domStorageEnabled = true
            allowFileAccess = true
            allowContentAccess = true
            cacheMode = WebSettings.LOAD_DEFAULT
        }

        webView.webChromeClient = object : WebChromeClient() {
            override fun onProgressChanged(view: WebView?, newProgress: Int) {
                super.onProgressChanged(view, newProgress)
                if (newProgress == 100) {
                    loadingAnim.visibility = View.GONE
                } else {
                    loadingAnim.visibility = View.VISIBLE
                }
            }
        }

        webView.webViewClient = object : WebViewClient() {
            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)
                loadingAnim.visibility = View.VISIBLE
            }
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                loadingAnim.visibility = View.GONE
                Log.d("WebView", "Page finished loading: $url")
            }
        }
    }

    private fun showBottomSheet() {
        // Add your BottomSheet implementation
    }

    protected abstract fun getAppBarTitle(): String
    protected abstract fun getInitialUrl(): String
}