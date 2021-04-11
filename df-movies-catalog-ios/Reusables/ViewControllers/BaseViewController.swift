//
//  BaseViewController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties

    /// Basic loading view.
    private lazy var loadingView: UIView = {

        let loadingContainerView = UIView()
        loadingContainerView.frame.size = CGSize(width: 100.0, height: 100.0)
        loadingContainerView.center = view.center

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        loadingContainerView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(
            equalTo: loadingContainerView.centerXAnchor
        ).isActive = true
        activityIndicator.centerYAnchor.constraint(
            equalTo: loadingContainerView.centerYAnchor
        ).isActive = true
        activityIndicator.center = loadingContainerView.center
        activityIndicator.startAnimating()

        loadingContainerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return loadingContainerView
    }()

    private var alertController: UIAlertController?

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    // MARK: - Custom Methods

    /// Navigation bar configurator
    func configureNavigationBar() {

        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /// Add right bar button item for navigation.
    /// - Parameters:
    ///   - title: Bar title.
    ///   - style: UIBarButtonItem style. Default is `plain`.
    ///   - selector: Button action.
    func addNavigationRightBarButtonItem(
        _ title: String,
        style: UIBarButtonItem.Style = .plain,
        selector: Selector?
    ) {

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: selector
        )
    }

    /// Shows loading view if there is not one.
    func showLoadingView() {

        guard !view.subviews.contains(loadingView) else { return }
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
    }

    /// Removes loading view.
    func hideLoadingView() {

        loadingView.removeFromSuperview()
    }

    func shouldShowLargeTitle(isLarge: Bool) {

        navigationController?.navigationBar.prefersLargeTitles = isLarge
        navigationItem.largeTitleDisplayMode = isLarge ? .automatic : .never
        navigationController?.navigationBar.sizeToFit()
    }
}

// MARK: - UIAlertController

extension BaseViewController {

    func presentAlertController(
        from context: BaseViewController,
        title: String?,
        message: String?,
        alertStyle: UIAlertController.Style,
        alertActions: [UIAlertAction],
        showCancel: Bool = false
    ) {

        alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: alertStyle
        )

        guard let alertController = alertController else { return }

        alertActions.forEach {

            alertController.addAction($0)
        }

        if showCancel {
            let cancel = UIAlertAction(
                title: StringTable.registration.localized("registration_ok"),
                style: .cancel
            ) { _ in

                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancel)
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionSheetBackgroundTapped(gesture:)))

        context.present(alertController, animated: true) {

            alertController.view.superview?.subviews.first?.isUserInteractionEnabled = true
            alertController.view.superview?.subviews.first?.addGestureRecognizer(tapGesture)
        }
    }

    @objc private func actionSheetBackgroundTapped(gesture: UITapGestureRecognizer) {

        alertController?.dismiss(animated: true, completion: nil)
    }
}
