//
//  MainView.swift
//  growingTextView
//
//  Created by alvin joseph valdez on 15/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public class MainView: UIView {
    
    // MARK: - Subviews
    private let scrollView: UIScrollView = {
        let view: UIScrollView = UIScrollView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private let viewContainer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    public let spaceView: UIView = {
        let view: UIView = UIView()
        
        return view
    }()
    
    public let questionTextView: UITextView = {
        let view: UITextView = UITextView()
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 9.0
        view.layer.masksToBounds = true
        view.isScrollEnabled = true
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = UIColor.white
        view.text = "type here"
        return view
    }()
    
    // MARK: Stored Properties
    private var keyboardManager: KeyboardManager?
    private var topTextViewConstraint: Constraint!
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.keyboardManager = KeyboardManager(scrollView: self.scrollView)
        self.keyboardManager?.beginObservingKeyboard()
        
        self.keyboardManager?.delegate = self
        
        self.viewContainer.subviews(forAutoLayout: [
            self.spaceView, self.questionTextView
        ])
        
        self.subviews(forAutoLayout: [
            self.scrollView
        ])
        
        self.scrollView.subviews(forAutoLayout: [
            self.viewContainer
        ])
        
        self.scrollView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
        
        self.viewContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()

        }
        
        self.spaceView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(self.scrollView.snp.height).inset(80.0)
        }
        
        self.questionTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(60.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(self.spaceView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
}

// MARK: - KeyboardManagerDelegate Methods
extension MainView: KeyboardManagerDelegate {
    public func kmScrollTo() {
        self.scrollView.scrollRectToVisible(self.questionTextView.frame, animated: true)
    }
}
