package com.hero.journal;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.view.Window;
import android.view.WindowManager;
import android.graphics.Color;
import android.os.Build;
import android.view.View;
public class MainActivity extends Activity {
 private WebView web;
 @Override public void onCreate(Bundle savedInstanceState){
  super.onCreate(savedInstanceState);
  getWindow().setStatusBarColor(Color.rgb(8,5,9));
  getWindow().setNavigationBarColor(Color.rgb(8,5,9));
  if(Build.VERSION.SDK_INT>=29) getWindow().getDecorView().setSystemUiVisibility(0);
  web=new WebView(this);
  WebSettings s=web.getSettings(); s.setJavaScriptEnabled(true); s.setDomStorageEnabled(true);
  s.setAllowFileAccess(true); s.setDatabaseEnabled(true); s.setDefaultTextEncodingName("UTF-8");
  web.setBackgroundColor(Color.rgb(8,5,9)); web.setWebChromeClient(new WebChromeClient());
  setContentView(web); web.loadUrl("file:///android_asset/web/index.html");
 }
 @Override public void onBackPressed(){ if(web!=null && web.canGoBack()) web.goBack(); else super.onBackPressed(); }
 @Override protected void onDestroy(){ if(web!=null){web.destroy();web=null;} super.onDestroy(); }
}