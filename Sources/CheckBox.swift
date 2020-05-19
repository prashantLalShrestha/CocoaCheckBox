//
//  CheckBox.swift
//  CocoaCheckBox
//
//  Created by Prashant Shrestha on 5/19/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

open class CheckBox: BEMCheckBox {
    
    public var tapAction: ((_ sender: CheckBox) -> ())?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public func makeUI() {
        
        self.boxType = .square
        self.on = false
        self.lineWidth = 2.0
        self.cornerRadius = 1.0
        self.animationDuration = 0.08
        self.hideBox = false
        
        self.delegate = self
        
        updateUI()
    }
    
    public func updateUI() {
        setNeedsDisplay()
    }
}

extension CheckBox: BEMCheckBoxDelegate {
    public func didTap(_ checkBox: BEMCheckBox) {
        self.tapAction?(checkBox as! CheckBox)
    }
}
