//
//  RegistrationViewController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import UIKit

// MARK: - Router

protocol RegistrationRouter: TabbarRoutable {}

struct DefaultRegistrationRouter: RegistrationRouter {}

// MARK: - RegistrationViewController

class RegistrationViewController: BaseViewController, StoryboardBased {

    private enum Constants {

        static let radius: CGFloat = 4.0
    }

    // MARK: - Properties

    static var storyboardName: String = Global.Storyboard.Registration.name

    private let router = DefaultRegistrationRouter()

    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var inputTitleLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var buttonsSeparatorLabel: UILabel!
    @IBOutlet private weak var loginViaWebsiteButton: UIButton!
    @IBOutlet private weak var footerLabel: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {

        view.backgroundColor = .alpha

        titleLabel.text = StringTable.registration.localized("registration_appTitle")
        titleLabel.textColor = .beta
        titleLabel.font = .primary25Bold

        inputTitleLabel.text = StringTable.registration.localized("registration_inputTitle")
        inputTitleLabel.textColor = .beta
        inputTitleLabel.font = .primary15Regular

        emailTextField.backgroundColor = .alphaVariant1
        emailTextField.placeholder = StringTable.registration.localized("registration_emailPlaceholder")
        emailTextField.keyboardType = .emailAddress
        emailTextField.textColor = .beta

        passwordTextField.backgroundColor = .alphaVariant1
        passwordTextField.placeholder = StringTable.registration.localized("registration_passwordPlaceholder")
        passwordTextField.textColor = .beta
        passwordTextField.isSecureTextEntry = true

        loginButton.backgroundColor = .alphaVariant2
        loginButton.setTitle(StringTable.registration.localized("registration_loginButtonTitle"), for: .normal)
        loginButton.setTitleColor(.beta, for: .normal)
        loginButton.layer.cornerRadius = Constants.radius

        buttonsSeparatorLabel.text = StringTable.registration.localized("registration_separatorTitle")
        buttonsSeparatorLabel.textColor = .beta

        loginViaWebsiteButton.backgroundColor = .alphaVariant2
        loginViaWebsiteButton.setTitle(StringTable.registration.localized("registration_loginViaWebSiteTitle"), for: .normal)
        loginViaWebsiteButton.setTitleColor(.beta, for: .normal)
        loginViaWebsiteButton.layer.cornerRadius = Constants.radius

        footerLabel.text = StringTable.registration.localized("registration_footerTitle")
        footerLabel.textColor = .beta
        footerLabel.numberOfLines = .zero
    }

    private func login() {

        guard Validations.isValidEmail(emailTextField.text ?? "") else {
            presentAlertController(
                from: self,
                title: StringTable.registration.localized("registration_validation_errorTitle"),
                message: StringTable.registration.localized("registration_validation_wrongEmailTitle"),
                alertStyle: .alert,
                alertActions: [],
                showCancel: true
            )
            return
        }

        guard Validations.isValidPassword(passwordTextField.text ?? "") else {
            presentAlertController(
                from: self,
                title: StringTable.registration.localized("registration_validation_errorTitle"),
                message: StringTable.registration.localized("registration_validation_wrongPasswordTitle"),
                alertStyle: .alert,
                alertActions: [],
                showCancel: true
            )
            return
        }
        router.setRootAsTabbar()
    }

    // MARK: - Actions

    @IBAction private func didTapOnLoginButton(_ sender: UIButton) {

        login()
    }

    @IBAction private func didTapOnLoginViaWebsiteButton(_ sender: UIButton) {

        login()
    }
}
