//
//  ViewController.swift
//  TableViewProject
//
//  Created by Юрий Демиденко on 02.11.2022.
//

import UIKit

// MARK: - UIViewController

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"],
        ["Strawberry", "Raspberry", "Blackberry", "Blueberry"]
    ]

    let headers = ["Fruits", "Vegetables", "Berries"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 32

        // Можно делать здесь или в сториборде
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words[section].count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell

        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "textCell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "textCell")
        }

        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content

        cell.selectionStyle = .blue

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil, message: "Вы выбрали: \(words[indexPath.section][indexPath.row])", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}
