//
//  ScrollViewController.swift
//  Collection_Scroll_View
//
//  Created by Зехниддин on 12/7/20.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Method

    func initViews() {
        addNavigationBar()
    }
    
    func addNavigationBar() {
        title = "Scroll View"
        
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
    }

    // MARK: - Action
    
    @objc func leftTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
