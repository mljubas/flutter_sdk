//
//  AdjustSdkPlugin.swift
//  Adjust SDK
//
//  Created by Adjust SDK Team on 20th February 2026.
//  Copyright (c) 2018-Present Adjust GmbH. All rights reserved.
//

import Flutter

@objc(AdjustSdk)
public class AdjustSdkPlugin: NSObject, FlutterPlugin {
    private var methodHandler: AdjustSdkMethodHandler?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "com.adjust.sdk/api",
            binaryMessenger: registrar.messenger()
        )
        let instance = AdjustSdkPlugin()
        instance.methodHandler = AdjustSdkMethodHandler(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        methodHandler?.handle(call, result: result)
    }
}
