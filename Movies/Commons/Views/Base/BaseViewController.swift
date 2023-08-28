//
//  BaseViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class BaseViewController<T: BasePresenterProtocol>: UIViewController, BaseViewProtocol, LogProvidable {
    var activityView: UIActivityIndicatorView?
    var presenter: T!
    var alertError: Error?
    convenience public init(presenter: T!) {

        self.init()
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewWillAppear()
    }

    func configureViewWillAppear() {

    }

    func configureViewDidLoad() {

    }
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator() {
        if activityView != nil {

            self.activityView?.stopAnimating()

        }
    }
    func showError(error: Error) {

        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    func showError(errorString: String) {

        let alert = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true, completion: nil)
    }

}
