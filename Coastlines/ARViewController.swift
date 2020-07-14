//
//  ARViewController.swift
//  Coastlines
//
//  Created by Ahad Islam on 5/27/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ARViewController: UIViewController {
    
    private let arView = ARCoastView()
    
    override func loadView() {
        view = arView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
