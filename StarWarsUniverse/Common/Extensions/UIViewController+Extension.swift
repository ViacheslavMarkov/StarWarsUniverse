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
    
    func presentTableViewAlert(
        title: String,
        dictionary: [String : String]
    ) {
        let view = PresenterTableViewAlertView(title: title, dictionary: dictionary)
        
        let viewController = UIViewController()
        viewController.view.addSubview(view)
        
        view.autoPinEdgesToSuperView()
        view.closeCallback = {
            viewController.dismiss(animated: true)
        }
        
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true)
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
