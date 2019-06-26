//
//  ViewController.swift
//  ScrollViewWIthButton
//
//  Created by Stewart Lynch on 2019-06-25.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let barButtonItem = UIBarButtonItem(title: "Show Scroll", style: .plain, target: self, action: #selector(showScrollVC))
        self.navigationItem.setRightBarButton(barButtonItem,animated: true)
    }

    
    @objc func showScrollVC() {
        let scrollVC = ScrollViewController()
        scrollVC.providesPresentationContextTransitionStyle = true
        scrollVC.definesPresentationContext = true
        scrollVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        scrollVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(scrollVC,animated: true)
    }

}

