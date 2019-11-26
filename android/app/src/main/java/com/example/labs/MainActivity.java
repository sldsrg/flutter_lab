package com.example.labs;

import android.os.Bundle;
import android.view.KeyEvent;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  private static final String VOLUME_CHANNEL = "samples.flutter.io/volume";

  private MethodChannel methodChannel;

  @Override
  public boolean onKeyDown(int keyCode, KeyEvent event) {
    if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN){
      methodChannel.invokeMethod("volume", "down");
      return true;
    }
    else if(keyCode == KeyEvent.KEYCODE_VOLUME_UP){
      methodChannel.invokeMethod("volume", "up");
      return true;
    }
    return super.onKeyDown(keyCode, event);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    methodChannel = new MethodChannel(getFlutterView(), VOLUME_CHANNEL);
  }
}
