'''
This file contains the implementation of the ChatViewController, which displays the chat interface and handles user input.
'''
import UIKit
import Firebase
class ChatViewController: UIViewController {
    // UI elements
    private var tableView: UITableView!
    private var inputTextField: UITextField!
    // Data source
    private var messages: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the table view
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        // Set up the input text field
        inputTextField = UITextField(frame: CGRect(x: 0, y: view.bounds.height - 50, width: view.bounds.width, height: 50))
        inputTextField.delegate = self
        inputTextField.placeholder = "Type a message..."
        inputTextField.borderStyle = .roundedRect
        view.addSubview(inputTextField)
    }
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
}
extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            messages.append(text)
            tableView.reloadData()
            textField.text = nil
        }
        return true
    }
}