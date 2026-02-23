//
//  AdjustSdk.kt
//  Adjust SDK
//
//  Copyright (c) 2018-Present Adjust GmbH. All rights reserved.
//

package com.adjust.sdk.flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class AdjustSdk : FlutterPlugin {
    private var channel: MethodChannel? = null
    private var methodHandler: AdjustSdkMethodHandler? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "com.adjust.sdk/api")
        methodHandler = AdjustSdkMethodHandler(binding.applicationContext, channel!!)
        channel!!.setMethodCallHandler(methodHandler)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
        methodHandler = null
    }
}
