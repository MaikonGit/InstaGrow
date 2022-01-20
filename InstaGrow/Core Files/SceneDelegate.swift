//
//  SceneDelegate.swift
//  InstaGrow
//
//  Created by Maikon Ferreira on 18/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }

    func createHomeNC() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createReelsNC() -> UINavigationController {
        let reelsVC = ReelsViewController()
        reelsVC.title = "Reels"
        reelsVC.tabBarItem.image = UIImage(systemName: "play.rectangle")
        reelsVC.tabBarItem.selectedImage = UIImage(systemName: "play.rectangle.fill")
        return UINavigationController(rootViewController: reelsVC)
    }

    func createStoreNC() -> UINavigationController {
        let storeVC = StoreViewController()
        storeVC.title = "Store"
        storeVC.tabBarItem.image = UIImage(systemName: "bag")
        storeVC.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        return UINavigationController(rootViewController: storeVC)
    }
    
    func createProfileNC() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        return UINavigationController(rootViewController: profileVC)
    }
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createHomeNC(), createSearchNC(), createReelsNC(), createStoreNC(), createProfileNC()]
        
        tabbar.tabBar.tintColor = .label
        return tabbar
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

