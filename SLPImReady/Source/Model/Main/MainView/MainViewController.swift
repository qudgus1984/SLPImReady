//
//  ViewController.swift
//  SLPImReady
//
//  Created by 이병현 on 2022/11/04.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<String, String>
    
    var datasource: DataSource!
    
    let mainview = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatasource()
        applySnapshot()
        mainview.collectionView.backgroundColor = .black
    }
    
    override func loadView() {
        super.view = mainview
    }
    
    func configureDatasource() {
        
        let cellConfigure = UICollectionView.CellRegistration<MainCollectionViewCell, String>.init(handler: { cell, indexPath, itemIdentifier in
            cell.label.text = itemIdentifier.description
            cell.backgroundColor = .tintColor
        })
    
        datasource = UICollectionViewDiffableDataSource<String, String>(collectionView: mainview.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellConfigure, for: indexPath, item: itemIdentifier)
        })
    }
    
    func applySnapshot() {
        let item = (1...20).map{ String($0) }
        var snapshot = self.datasource.snapshot()
        snapshot.appendSections(["첫번째"])
        snapshot.appendItems(item)
        datasource.apply(snapshot)
    }
}

 
