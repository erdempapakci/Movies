//
//  DetailViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewPresenter> {

    private lazy var detailComponent: DetailViewComponent = .init() &> {

        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var visitButton: UIBarButtonItem = .init() &> {
        $0.tintColor = .white
        $0.target = self
        $0.image = UIImage(named: "imdb")?.withRenderingMode(.alwaysOriginal)
        $0.action = #selector(visitButtonTapped)
    }
    private lazy var saveButton: UIBarButtonItem = .init() &> {
        $0.tintColor = .white
        $0.target = self
        $0.action = #selector(saveButtonClicked)
    }

    override func configureViewDidLoad() {
        super.configureViewDidLoad()

        presenter.viewDidload()
        view.backgroundColor = .darkGray

        configureConstraints()

    }

    private func configureConstraints() {

        view.addSubview(detailComponent)
        navigationItem.rightBarButtonItems = [  saveButton, visitButton

        ]
        NSLayoutConstraint.activate([
            detailComponent.topAnchor.constraint(equalTo: view.topAnchor),
            detailComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    @objc private func saveButtonClicked() {
        if saveButton.image == UIImage(systemName: "star.fill")! {
            presenter.deleteFromCore()
            saveButton.image = UIImage(systemName: "star")
        } else {
            presenter.saveToCore()
            saveButton.image = UIImage(systemName: "star.fill")
        }
        NotificationCenter.default.post(name: .refreshSaved, object: nil)

    }
    @objc private func visitButtonTapped() {
        if (presenter.detailData?.imdbID) != nil {
            presenter.openURL()
        } else {
            showError(errorString: UIErrors.emptyIMDBID.localizedDescription)
        }

    }
    func setTitle(title: String) {
        navigationController?.setLargeTitleStyle(.custom(color: .white, font: .boldSystemFont(ofSize: 25)))
               navigationItem.title = title
    }

}
extension DetailViewController: DetailViewProtocol {

    func setDetail(data: MovieDetail) {

         detailComponent.setData(value: data)
        setTitle(title: data.originalTitle ?? "")
    }
    func saveButtonFill() {
        saveButton.image = UIImage(systemName: "star.fill")
    }
    func saveButtonUnFill() {
        saveButton.image = UIImage(systemName: "star")
    }
}
