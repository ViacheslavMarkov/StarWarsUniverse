//
//  UIViewController+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 05.01.2023.
//

import UIKit

extension UIViewController {
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
    
    func presentBasicAlert(
        title: String = "Error",
        message: String = "Something went wrong.",
        buttonTitle: String = "Okay",
        isAutomaticallyDismissed: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if isAutomaticallyDismissed {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                alertController.dismiss(animated: true, completion: completion)
            })
        }
        let alertAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            alertController.dismiss(animated: true, completion: completion)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

extension UIViewController {
    func showActivityIndicator() {
        let animationView = createActivityIndicatorView()
        animationView.startAnimating()
    }
    
    func hideActivityIndicator() {
        let animationView = self.view.subviews.compactMap { $0 as? DownloadIndicatorView }.first
        animationView?.stopAnimating()
        animationView?.removeFromSuperview()
    }
    
    private func createActivityIndicatorView() -> DownloadIndicatorView {
        guard let activityView = self.view.subviews.compactMap({ $0 as? DownloadIndicatorView }).first else {
            
            let activityView = DownloadIndicatorView()
            activityView.backgroundColor = .white.withAlphaComponent(0.9)
            activityView.frame = self.view.bounds
            
            self.view.addSubview(activityView)
            activityView.autoPinEdgesToSuperView()
            
            return activityView
        }
        return activityView
    }
}
