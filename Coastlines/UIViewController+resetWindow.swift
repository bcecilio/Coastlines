//
//  UIViewController+resetWindow.swift
//  Coastlines
//
//  Created by Cameron Rivera on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Changes the root view controller to the one passed in as a parameter.
    static func resetWindow(_ vc: UIViewController){
        guard let scene = UIApplication.shared.connectedScenes.first, let sceneDelegate = scene.delegate as? SceneDelegate, let window = sceneDelegate.window else {
            fatalError("Could not reset scene.window's rootViewController")
        }
        window.rootViewController = vc
    }
}
