//
//  AppDelegate.swift
//  Bankey
//
//  Created by Kyle  Clutter on 9/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
//    window?.rootViewController = LoginViewController()
    window?.rootViewController = OnboardingContainerViewController()
//    window?.rootViewController = OnbordingViewController(heroImage: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80's")
    return true
  }
}
