//
//  AppDelegate.swift
//  ElecDemo
//
//  Created by NhatHM on 8/9/19.
//  Copyright © 2019 GST.PID. All rights reserved.
//

import UIKit
import CoreMotion

var pedometer = CMPedometer()

@objc public class virtualdevice_ios:NSObject {
    let v = BLEPeripheralManager()
}

@objc public class healthkit:NSObject {
    let w = watchAppStart()
        
    @objc public func request()
    {
        LocalNotificationHelper.requestPermission()
        WatchKitConnection.shared.startSession()
        
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { pedometerData, error in
                guard let pedometerData = pedometerData, error == nil else { return }
                    print("\(pedometerData.numberOfSteps.intValue) STEP CAD.")
            }
        }

        
        //w.startWatchApp()
    }
    
    @objc public func heartRate() -> Int
    {
        return WatchKitConnection.currentHeartRate;
    }
    
    @objc public func stepCadence() -> Int
    {
        return WatchKitConnection.stepCadence;
    }
    
    @objc public func setDistance(distance: Double) -> Void
    {
        WatchKitConnection.distance = distance;
    }
    
    @objc public func setKcal(kcal: Double) -> Void
    {
        WatchKitConnection.kcal = kcal;
    }
}
/*
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        LocalNotificationHelper.requestPermission()
        
        WatchKitConnection.shared.startSession()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        backgroundTask = UIApplication.shared.beginBackgroundTask { [unowned self] in
            //            UIApplication.shared.endBackgroundTask(backgroundTask)
            //            self?.backgroundTask = .invalid
            UIApplication.shared.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskIdentifier.invalid
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

*/
