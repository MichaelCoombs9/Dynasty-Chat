'''
This file contains the implementation of the AuthViewController, which handles user authentication and login/signup functionality.
'''
import UIKit
import Firebase
class AuthViewController: UIViewController {
    // UI elements
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the email text field
        emailTextField = UITextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 40))
        emailTextField.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY - 80)
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.autocapitalizationType = .none
        view.addSubview(emailTextField)
        // Set up the password text field
        passwordTextField = UITextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 40))
        passwordTextField.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY - 20)
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        // Set up the login button
        loginButton = UIButton(type: .system)
        loginButton.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 40)
        loginButton.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 20)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        // Set up the signup button
        signupButton = UIButton(type: .system)
        signupButton.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 40)
        signupButton.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 80)
        signupButton.setTitle("Signup", for: .normal)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        view.addSubview(signupButton)
    }
    @objc func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
            } else {
                // Login successful, navigate to the chat view controller
                let viewController = ChatViewController()
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    @objc func signupButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print("Signup error: \(error.localizedDescription)")
            } else {
                // Signup successful, navigate to the chat view controller
                let viewController = ChatViewController()
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}