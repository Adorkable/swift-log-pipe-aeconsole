//
//  AppDelegate.swift
//  Example
//
//  Created by Ian Grossberg on 8/14/19.
//

import UIKit

import Logging
import LoggingFormatAndPipe

import AEConsole
import LoggingPipeAEConsole

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let logger = Logger(label: "Example") { (_) -> LogHandler in
        return LoggingFormatAndPipe.Handler(
            formatter: BasicFormatter.adorkable,
            pipe: LoggerPipeAEConsole()
        )
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // For some reason simulator doesn't have a window ready yet, but then replaces ours late, hence the Timer below
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()

        let settings = Console.shared.settings

        /// - Note: Customize Console settings like this, these are defaults:
        settings.isShakeGestureEnabled = true
        settings.backColor = UIColor.black
        settings.textColor = UIColor.white
        settings.fontSize = 12.0
        settings.rowSpacing = 4.0
        settings.opacity = 0.7

        /// - Note: Configure Console in app window (it's recommended to skip this for public release)
        Console.shared.configure(in: window)

        AppDelegate.logger.info("Application did finish launching with options")

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in
            Console.shared.configure(in: UIApplication.shared.windows.first)
          }

        return true
    }
}

