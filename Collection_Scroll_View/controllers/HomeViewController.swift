//
//  HomeViewController.swift
//  Collection_Scroll_View
//
//  Created by Зехниддин on 12/7/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items: [Item] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    
    // MARK: - Method

    func initViews() {
        setNavigationBar()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        items.append(Item(image: "im_coding1", title: "Best Coding"))
        items.append(Item(image: "im_coding2", title: "Amazing Code"))
        
    }
    
    func setNavigationBar() {
        title = "Collection View"
        
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
    }
    
    func callScrollController() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Action
    
    @objc func rightTapped() {
        callScrollController()
    }
    
    
    // MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: item.image!)
        cell.titleLabel.text = item.title
        
        return cell
    }
}
