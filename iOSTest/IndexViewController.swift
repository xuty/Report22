//
//  Untitled.swift
//  iOSTest
//
//  Created by Z on 2024/10/19.
//

import UIKit

class IndexViewController : UITableViewController {
    let data = [
        ["WKWebview(Camara)","WKWebviewController"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "IndexViewControllerCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resueTabCell = self.tableView.dequeueReusableCell(withIdentifier: "IndexViewControllerCell", for: indexPath)
        return resueTabCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className = self.data[indexPath.row][1]
        let titile = self.data[indexPath.row][0]
        if let cls: AnyClass = NSClassFromString(className) {
            if let object = cls as? UIViewController.Type {
                let instance = object.init()
                instance.title = titile
                self.navigationController?.pushViewController(instance, animated: true)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = self.data[indexPath.row][0]
    }
}
