//
//  ViewController.swift
//  growingTextView
//
//  Created by alvin joseph valdez on 15/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    public override func loadView() {
        super.loadView()
        
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MainVC {
    public var rootView: MainView { return self.view as! MainView }
}
