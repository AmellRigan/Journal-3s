# Keep JS bridge methods callable from WebView
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
