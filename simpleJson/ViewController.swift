//
//  ViewController.swift
//  simpleJson
//
//  Created by manish on 23/01/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    //var response:JSON = JSON.null
    var userAll:[userModol] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIManager()
        api.getUserData(){(userJson)-> Void in
            if userJson != JSON.null {
                for i in 0..<userJson.count {
                    let singleUser = userModol(res:userJson[i])
                    self.userAll.append(singleUser)
                    self.userTableView.reloadData()
                    

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAll.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let singleUser = userAll[indexPath.row]
        cell.textLabel?.text = singleUser.userId
        return cell
    }
    
}

