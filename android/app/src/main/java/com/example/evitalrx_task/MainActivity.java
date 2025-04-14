package com.example.evitalrx_task;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Map;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.evitalrx/utm";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    if (call.method.equals("getUTMParams")) {
                        Intent intent = getIntent();
                        Uri data = intent.getData();
                        Map<String, String> utmParams = new HashMap<>();

                        if (data != null) {
                            String utmSource = data.getQueryParameter("utm_source");
                            String utmMedium = data.getQueryParameter("utm_medium");
                            String utmCampaign = data.getQueryParameter("utm_campaign");

                            utmParams.put("utm_source", utmSource != null ? utmSource : "");
                            utmParams.put("utm_medium", utmMedium != null ? utmMedium : "");
                            utmParams.put("utm_campaign", utmCampaign != null ? utmCampaign : "");
                        }

                        result.success(utmParams);
                    } else {
                        result.notImplemented();
                    }
                });
    }
}
