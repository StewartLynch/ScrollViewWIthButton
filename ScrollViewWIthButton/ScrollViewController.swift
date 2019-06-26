//
//  ScrollViewController.swift
//  ScrollViewWIthButton
//
//  Created by Stewart Lynch on 2019-06-25.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate  {

    var scrolItems:[UIColor] = [.red, .green, .yellow, .orange]
    
//    var frame = CGRect.zero
    
    lazy var pageControll: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        pc.backgroundColor = .white
        pc.numberOfPages = scrolItems.count
        return pc
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: CGRect(x: 0, y: 40, width: view.frame.width, height: 300))
        //        let sv = UIScrollView(frame: .zero)
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.backgroundColor = .clear
        return sv
    }()
    
    fileprivate func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleWidth]
        view.addSubview(pageControll)
        pageControll.backgroundColor = .clear
        NSLayoutConstraint.activate([
            pageControll.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControll.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageControll.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageControll.heightAnchor.constraint(equalToConstant: 10)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 147/255, green: 147/255, blue: 147/255, alpha: 0.5)
        setupScrollView()
        setupScrollContent()
    }
    
    fileprivate func setupScrollContent(){
        for (index, color) in scrolItems.enumerated() {
            let contentView = ScrollContentView(frame: .zero)
            contentView.color = color
            contentView.delegate = self
            scrollView.addSubview(contentView)
            scrollView.addSubview(contentView)
            contentView.frame.size.width = self.view.bounds.size.width
            contentView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            contentView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleWidth, .flexibleHeight]
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(scrolItems.count)), height: scrollView.frame.height)
        
        scrollView.delegate = self
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        scrollView.contentSize = CGSize(width: size.width * CGFloat(scrolItems.count), height: 300)
        scrollView.contentOffset.x = size.width * CGFloat(pageControll.currentPage)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControll.currentPage = Int(pageNumber)
    }
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }

}
