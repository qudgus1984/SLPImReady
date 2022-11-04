//
//  UIViewController+.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import UIKit

extension UIViewController {
    
    public func presentAlert(
        title: String,
        message: String? = nil,
        isIncludedCancel: Bool = false,
        completion: ( (UIAlertAction) -> Void )? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isIncludedCancel {
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(cancel)
        }
        
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

extension UIViewController {
    
    public enum TransitionStyle {
        case present
        case presentNavigation
        case push
        case presentFullScreen
        case presentCrossDisolve
    }
    
    public func transition<T: UIViewController>(_ viewController: T, transitionStyle: TransitionStyle = .present, handler: ( (T) -> Void)? = nil) {
        
        handler?(viewController)
        
        switch transitionStyle {
        case .present:
            self.present(viewController, animated: true)
            
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: viewController)
            self.present(nav, animated: true)
            
        case .push:
            self.navigationController?.pushViewController(viewController, animated: true)
            
        case .presentFullScreen:
            let nav = UINavigationController(rootViewController: viewController)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
            
        case .presentCrossDisolve:
            viewController.modalPresentationStyle = .overFullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true)
        }
    }
}
