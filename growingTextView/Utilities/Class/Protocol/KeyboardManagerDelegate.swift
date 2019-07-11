//
//  KeyboardManagerDelegate.swift
//  growingTextView
//
//  Created by alvin joseph valdez on 15/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public protocol KeyboardManagerDelegate: class {    
    func kmScrollTo()
    func kmDidShow(height: CGFloat)
    func kmDidHide()
}

extension KeyboardManagerDelegate {
    public func kmScrollTo() {}
    public func kmDidShow(height: CGFloat) {}
    public func kmDidHide() {}
}
