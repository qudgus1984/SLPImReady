//
//  MainSecondCollectionViewCell.swift
//  SLPImReady
//
//  Created by 이병현 on 2022/11/06.
//

import Foundation

import UIKit
import SnapKit

class MainSecondCollectionViewCell :UICollectionViewCell {
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
