//
//  CheckBoxView.swift
//  CocoaCheckBox
//
//  Created by Prashant Shrestha on 5/19/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

fileprivate struct BaseDimensions {
    static var stackViewSpacing: CGFloat {
        return 8
    }
    
    static var checkBoxHeight: CGFloat {
        return 20
    }
}

public class CheckBoxView: UIView {
    
    public var delegate: BEMCheckBoxDelegate?
    
    public lazy var checkBox: CheckBox = {
        let view = CheckBox()
        view.delegate = delegate
        view.lineWidth = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: BaseDimensions.checkBoxHeight).isActive = true
        return view
    }()
    public lazy var checkBoxLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        return view
    }()
    private lazy var checkboxStackView: UIStackView = {
        let subviews: [UIView] = [checkBox, checkBoxLabel]
        let view = UIStackView(arrangedSubviews: subviews)
        view.axis = .horizontal
        view.spacing = BaseDimensions.stackViewSpacing
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    private lazy var button: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor.clear
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    public var text: String? {
        get {
            return checkBoxLabel.text
        }
        set {
            checkBoxLabel.text = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    public var tapAction: ((CheckBoxView) -> ()) = { checkBoxView in
        checkBoxView.checkBox.setOn(!checkBoxView.checkBox.on, animated: true)
    }
    
    public func makeUI() {
        
        self.addSubview(checkboxStackView)
        checkboxStackView.translatesAutoresizingMaskIntoConstraints = false
        checkboxStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        checkboxStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        checkboxStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        checkboxStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = true
    }
    
    @objc func buttonAction() {
        self.tapAction(self)
    }
}
