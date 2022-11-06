//
//  ViewController.swift
//  SLPImReady
//
//  Created by 이병현 on 2022/11/04.
//

import UIKit
import SnapKit
import RxSwift

class MainViewController: BaseViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<String, String>
    
    var datasource: DataSource!
    let mainview = MainView()
    let searchController = UISearchController(searchResultsController: nil)
    let disposeBag = DisposeBag()
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatasource()
        applySnapshot()
        mainview.collectionView.backgroundColor = .black
    }
    
    
    override func loadView() {
        super.view = mainview
    }
    
    override func configure() {
        searchController.searchBar.placeholder = "검색할 키워드를 입력해주세요."
        self.navigationItem.searchController = searchController
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .black
        navigationItem.standardAppearance = appearence
        navigationItem.scrollEdgeAppearance = appearence
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func configureDatasource() {
        
        let cellConfigure = UICollectionView.CellRegistration<MainCollectionViewCell, String>.init(handler: { cell, indexPath, itemIdentifier in
            cell.label.text = itemIdentifier.description
            cell.backgroundColor = .tintColor
        })
        
        let cellSecondConfigure = UICollectionView.CellRegistration<MainSecondCollectionViewCell, String>.init(handler: { cell, indexPath, itemIdentifier in
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
    
    func bind() {
        
    }
}





 
