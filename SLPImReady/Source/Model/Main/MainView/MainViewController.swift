//
//  ViewController.swift
//  SLPImReady
//
//  Created by 이병현 on 2022/11/04.
//

import UIKit

class MainViewController: BaseViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Int>
        
    var datasource: DataSource!
    
    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: <#T##UICollectionViewLayout#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    func configureDataSource() {
    }


}

