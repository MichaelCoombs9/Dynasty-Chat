'''
This file is the entry point of the iOS app. It initializes the main window and sets the root view controller to the ChatViewController.
'''
import UIKit
import Firebase
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        // Initialize the main window
        window = UIWindow(frame: UIScreen.main.bounds)
        // Set the root view controller based on user authentication status
        if Auth.auth().currentUser != nil {
            let viewController = ChatViewController()
            window?.rootViewController = viewController
        } else {
            let authViewController = AuthViewController()
            window?.rootViewController = authViewController
        }
        // Make the window visible
        window?.makeKeyAndVisible()
        return true
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        // Initialize the main window
        window = UIWindow(frame: UIScreen.main.bounds)
        // Set the root view controller based on user authentication status
        if Auth.auth().currentUser != nil {
            let viewController = ChatViewController()
            window?.rootViewController = viewController
        } else {
            let authViewController = AuthViewController()
            window?.rootViewController = authViewController
        }
        // Make the window visible
        window?.makeKeyAndVisible()
        return true
    }
}