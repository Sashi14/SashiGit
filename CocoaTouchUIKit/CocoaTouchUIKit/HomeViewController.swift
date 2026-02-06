//
//  HomeViewController.swift
//  CocoaTouchUIKit
//
//  Created by Sashi Jagadam on 06/02/26.
//

import UIKit

//HomeViewController manages the first scene of the app
class HomeViewController : UIViewController {
    //UILabel to display messages on the screen
    let messageLabel = UILabel()
    //UIButton to handle user interaction using Target-Action pattern
    let tapButton = UIButton(type: .system)
    
    //Called once when the view controller's view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white //Set background colour of the screen
        title = "Cocoa Touch Demo" //Set navigation bar title
        //Setup UI elements
        setupLabel()
        setupButton()
        setupGesture()
    }
    
    //Configure and add UIlabel to the view
    func setupLabel() {
        messageLabel.text = "Hello Cocoa Touch"     //Initial text
        messageLabel.textAlignment = .center        //Center the text
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        //messageLabel.frame = CGRect(x: 40, y: 200, width: 300, height: 40)
        view.addSubview(messageLabel)  //Add label to screen
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40)
        ])
    }
    
    //Configure and add UIButton to the view
    func setupButton() {
        tapButton.setTitle("Go to List", for: .normal)  //Button title
        //tapButton.frame = CGRect(x: 60, y: 250, width: 140, height: 44)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Target-Action pattern:
        //When button is tapped, buttonTapped() is called
        tapButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(tapButton)   //Add button to screen
        NSLayoutConstraint.activate([
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
    
    //Add a tap gesture recognizer to the view
    func setupGesture()
    {
        //UITapGestureRecognizer detects tap gestures
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture) //Add tap gesture recognizer to screen
    }
    
    //Actions Methods
    //Called when button is tapped
    @objc func buttonTapped() {
        messageLabel.text = "Button tapped"   //Update label text
        //Navigate to next screen (ListViewController)
        let listVC = ListViewController()
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    //Called when screen is tapped using gesture recognizer
    @objc func viewTapped() {
        messageLabel.text = "Screen tapped"
    }
    
    //Touch handling (low-level)
    //Called when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Get the first touch
        if let touch = touches.first {
            //Get the touch location relative to the view
            let location = touch.location(in: self.view)
            print("Touch at: \(location)")  //Print touch coordinates (debug purpose)
        }
    }
}
