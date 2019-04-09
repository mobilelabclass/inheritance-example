//
//  ViewController.swift
//  InheritanceExample
//
//  Created by Nien Lam on 4/9/19.
//  Copyright © 2019 Line Break, LLC. All rights reserved.
//

import UIKit

// Custom class inherited from UIImageView.
class ProfileView: UIImageView {

    // Public variable for setting name label.
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    // Make this internal to class.
    private var nameLabel: UILabel!
    
    // Override the initialization method.
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Style image view.
        self.layer.cornerRadius = 16.0
        self.clipsToBounds      = true
        self.layer.borderColor  = UIColor.brown.cgColor
        self.layer.borderWidth  = 4.0
        self.contentMode        = .scaleAspectFill

        // Style and position label.
        self.nameLabel = UILabel()
        self.nameLabel.font          = UIFont.systemFont(ofSize: 14)
        self.nameLabel.textColor     = UIColor.white
        self.nameLabel.textAlignment = .center
        self.nameLabel.frame.size    = CGSize(width: self.frame.width, height: 36.0)
        self.nameLabel.frame.origin  = CGPoint(x: 0.0, y: self.frame.height - 36.0)
        self.addSubview(self.nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Data for views.
struct ProfileViewData {
    var name: String
    var imageName: String
}

let DataArray = [
    ProfileViewData(name: "arya stark", imageName: "arya-stark.jpg"),
    ProfileViewData(name: "jon snow", imageName: "jon-snow.jpg"),
    ProfileViewData(name: "tyrion lannister", imageName: "tyrion-lannister.jpg"),
]


class ViewController: UIViewController {

    // Default size and frame for profile views.
    let viewSize: CGFloat = 160.0

    // Padding between views.
    let padding: CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Track last placed profile view. Set start value.
        var lastCenterYposition: CGFloat = 0.0
        
        // Loop through data to create and position profile views.
        for data in DataArray {
            // Use our custom ProfileView.
            let profileView    = ProfileView(frame: CGRect(x: 0, y: 0, width: viewSize, height: viewSize))
            profileView.image  = UIImage(named: data.imageName)
            profileView.name   = data.name.uppercased()
            profileView.center = CGPoint(x: self.view.center.x,y: lastCenterYposition + viewSize + padding)
            self.view.addSubview(profileView)

            lastCenterYposition = profileView.center.y
        }
    }
}

