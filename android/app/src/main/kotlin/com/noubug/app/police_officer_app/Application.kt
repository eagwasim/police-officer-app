package com.noubug.app.police_officer_app

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;


class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun registerWith(p0: PluginRegistry?) {
        GeneratedPluginRegistrant.registerWith(p0)
    }

    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this);
    }
}