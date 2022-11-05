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

    lazy var collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureDatasource()
        applySnapshot()
        collectionview.backgroundColor = .black
    }
    
    func setupLayout() {
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureDatasource() {
        
        let cellConfigure = UICollectionView.CellRegistration<selfSizableCell, String>.init(handler: { cell, indexPath, itemIdentifier in
            cell.label.text = itemIdentifier.description
            cell.backgroundColor = .tintColor
        })
    
        datasource = UICollectionViewDiffableDataSource<String, String>(collectionView: collectionview, cellProvider: { collectionView, indexPath, itemIdentifier in
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
    
    
    func layout() -> UICollectionViewLayout {
        // size, item(cell), group, section
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10   , leading: 10, bottom: 10, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item ,count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

class selfSizableCell:UICollectionViewCell {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 
