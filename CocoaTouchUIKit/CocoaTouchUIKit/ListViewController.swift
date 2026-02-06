//
//  ListViewController.swift
//  CocoaTouchUIKit
//
//  Created by Sashi Jagadam on 06/02/26.
//

import UIKit
//Demonstrate UiTableView, DataSource, Delegation and MVC

//ListViewController displays a list using UITableView
class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView() //Table view to display list items
    //Data source [Model in MVC]
    let items = ["UIKit", "SwiftUI", "Core Animation", "Core Data", "AVFoundation"]
    
    //Add exit button to the screen
    //let exitButton = UIButton(type: .system)
    
    //Called when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white  //setting background colour
        title = "Frameworks" //Set navigation bar title
        
        //setupExitButton() //Setup Exit Button
        //setupNavigationBar()
        setupTableView() //Setup table view
        
    }
    
    //Navigation bar exit button
    func setupNavigationBar() {
        //Create exit button in navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Exit",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(exitButtonTapped))
    }
    
    
    //Exit button is not visible due to the following reasons
    //1. Table view is covering the button
    //2. Since we are using navigation bar (UINavigationController) the corrent place for exit button is in the navigation bar not inside the view.
    //So adding navigation bar button instead
    //Exit Button Setup
    /*func setupExitButton() {
        exitButton.setTitle("Exit", for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        //exit button action
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }*/
    
    @objc func exitButtonTapped() {
        navigationController?.popViewController(animated: true) //Navigate back which is the right cocoa touch way
    }
    
    
    //Configure and add table view
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    //UITableViewDataSource
    //Returns number of rows in the tab;le view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Create and return cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell") //Create a basic table view cell
        cell.textLabel?.text = items[indexPath.row] //Set text for cell
        return cell
    }
    
    //UITableViewDelegate
    //Called when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected:", items[indexPath.row])  //Print selected item
        
    }
}
