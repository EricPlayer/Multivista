//
//  AppDelegate.swift
//  Multiviasta
//
//  Created by Eric on 2019/10/7.
//  Copyright © 2019 Javier. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var sizes = [String]()
    var doughs = [String]()
    var cheeses = [String]()
    var ingredients = [String]()
    var selSize = 0, selDough = 0, selCheese = 0, selInd = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let url = Bundle.main.url(forResource: "config", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = JSON(data)
                let sizeArray = jsonData["size"].arrayValue
                var count = sizeArray.count
                sizes.removeAll()
                for i in (0...count-1) {
                    sizes.append(sizeArray[i].rawString()!)
                }
                let doughArray = jsonData["dough"].arrayValue
                count = doughArray.count
                doughs.removeAll()
                for i in (0...count-1) {
                    doughs.append(doughArray[i].rawString()!)
                }
                let cheeseArray = jsonData["cheesetype"].arrayValue
                count = cheeseArray.count
                cheeses.removeAll()
                for i in (0...count-1) {
                    cheeses.append(cheeseArray[i].rawString()!)
                }
                let ingredientArray = jsonData["ingredients"].arrayValue
                count = ingredientArray.count
                ingredients.removeAll()
                for i in (0...count-1) {
                    ingredients.append(ingredientArray[i].rawString()!)
                }
            } catch {
                print("error:\(error)")
            }
        }
        
        RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 2) as Date)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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

