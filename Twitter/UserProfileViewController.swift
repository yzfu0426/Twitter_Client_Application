//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by 傅羽竹 on 2021/9/26.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailInformationTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    var user_information: [String: Any]?
    
    
   // let user_name = user_information?["name"] as! String
    
    
    let UserNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let FollowingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let FollowerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    private let ProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailInformationTableView.delegate = self
        detailInformationTableView.dataSource = self
        // Do any additional setup after loading the view.
        headerView.addSubview(UserNameLabel)
        headerView.addSubview(ProfileImage)
        headerView.addSubview(FollowerLabel)
        headerView.addSubview(FollowingLabel)
        print(user_information!)
        let followers_count = user_information!["followers_count"]
        print(followers_count!)
        let following_count = user_information!["friends_count"]
        print(followers_count!)
        UserNameLabel.text = (user_information!["name"] as! String)
        FollowerLabel.text = "Followers: " + "\(followers_count!)"
        FollowingLabel.text = "Following: " + "\(following_count!)"
        setupConstraints()
        
        
        
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(ProfileImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor))
        constraints.append(ProfileImage.topAnchor.constraint(equalTo: headerView.topAnchor))
        constraints.append(ProfileImage.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(ProfileImage.heightAnchor.constraint(equalToConstant: 170))
        
        constraints.append(UserNameLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -50))
        constraints.append(UserNameLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: -50))
        
        constraints.append(FollowingLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -5))
        constraints.append(FollowingLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0))
        
        constraints.append(FollowerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0))
        constraints.append(FollowerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 50))
        
        
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailInformationTableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        //cell.UserNameLabel.text = user_information!["name"] as! String
        
        
        return cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
