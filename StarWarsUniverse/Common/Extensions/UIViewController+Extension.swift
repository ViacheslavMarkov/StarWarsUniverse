//
//  UIViewController+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 05.01.2023.
//

import UIKit

extension UIViewController {
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
