//
//  AppRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()
    }

    func main() {
        let viewController = MainNavigation(rootViewController:   RoumingConfigurator.configure(RoumingViewController()))
       
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }

}
