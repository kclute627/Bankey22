//
//  ViewController.swift
//  Bankey
//
//  Created by Kyle  Clutter on 9/12/22.
//

import UIKit

class LoginViewController: UIViewController {
  let headerTop = UILabel()
  let headerMiddle = UILabel()
  let loginView = LoginView()
  let signInButton = UIButton(type: .system)
  let errorLabel = UILabel()

  var userName: String? {
    return loginView.usernameTextField.text
  }

  var password: String? {
    return loginView.passwordTextField.text
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    style()
    layout()
  }
}

extension LoginViewController {
  private func style() {
    // MARK: Header

    headerTop.translatesAutoresizingMaskIntoConstraints = false
    headerMiddle.translatesAutoresizingMaskIntoConstraints = false

    headerTop.font = headerTop.font.withSize(40)
    headerTop.font = UIFont.boldSystemFont(ofSize: 50)
    // need to switch for dark mode
    headerTop.textColor = .black
    headerTop.text = "Bankey"
    headerTop.textAlignment = .center

    headerMiddle.font = headerTop.font.withSize(20)
    headerMiddle.font = UIFont.boldSystemFont(ofSize: 20)
//    headerMiddleo switch for dark mode
    headerMiddle.textColor = .black
    headerMiddle.text = "Your premium source for all things banking!"
    headerMiddle.textAlignment = .center
    headerMiddle.numberOfLines = 0

    loginView.translatesAutoresizingMaskIntoConstraints = false

    // MARK: Sign in Button

    signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.configuration = .filled()
    signInButton.configuration?.imagePadding = 8
    signInButton.setTitle("Sign In", for: [])
    signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

    // MARK: ErrorLabel

    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.textAlignment = .center
    errorLabel.textColor = .systemRed
    errorLabel.numberOfLines = 0
    errorLabel.isHidden = true
//    errorLabel.text = "Error Failure"
  }

  private func layout() {
    view.addSubview(headerTop)
    view.addSubview(headerMiddle)
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorLabel)

    // MARK: Header

    NSLayoutConstraint.activate([
      headerTop.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15),
//      headerTop.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//      view.trailingAnchor.constraint(equalToSystemSpacingAfter: headerTop.trailingAnchor, multiplier: 2),
      headerTop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      headerMiddle.centerXAnchor.constraint(equalTo: headerTop.centerXAnchor),
      headerMiddle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
      headerMiddle.topAnchor.constraint(equalToSystemSpacingBelow: headerTop.bottomAnchor, multiplier: 5),
    ])

    // MARK: Login View

    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),

    ])

    // MARK: Button

    NSLayoutConstraint.activate([
      signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
      signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),

    ])

    // MARK: ErrorLabel

    NSLayoutConstraint.activate([
      errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
      errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      errorLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
    ])
  }
}

// MARK: Actions

extension LoginViewController {
  @objc func signInTapped(sender: UIButton) {
    errorLabel.isHidden = true
    login()
  }

  private func login() {
    guard let username = userName, let password = password else {
      assertionFailure("Username and password should never be nil")
      return
    }
    if username.isEmpty || password.isEmpty {
      // disable the button
      configureView(withMessage: "Username / Password can not be blank")
      return
    }

    if username == "Kyle" && password == "123456" {
      signInButton.configuration?.showsActivityIndicator = true
    } else {
      configureView(withMessage: "Incorrect username / password")
      return
    }
  }

  private func configureView(withMessage message: String) {
    errorLabel.isHidden = false
    errorLabel.text = message
  }
}
