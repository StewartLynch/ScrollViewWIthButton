//
//  ScrollView.swift
//  ScrollViewWIthButton
//
//  Created by Stewart Lynch on 2019-06-25.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class ScrollContentView: UIView {
    
    var contentView = UIView()
    var actionButton = UIButton(frame: .zero)
    var color:UIColor! {
        didSet {
            contentView.backgroundColor = color
        }
    }
    
    weak var delegate: ScrollViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300/2).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 250 ).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 281).isActive = true
        
        contentView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.backgroundColor = .blue
        actionButton.setTitle("Dismiss", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        actionButton.addTarget(self, action: #selector(closeHelp), for: .touchUpInside)
    }
    
    
    // Note:  If I uncomment this function, the tap passes through to the button in portrait mode, but NOT in landscape mode
    
    /*
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in self.subviews as [UIView] {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside:point, with: event) {
                return true
            }
        }

        return false
    }
 */
    
    
    
    @objc func closeHelp() {
        print("tapped")
        delegate.dismissVC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
