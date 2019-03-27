//
//  ViewController.swift
//  FlagList
//
//  Created by Mattia on 22/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countries: [[Country]] = [[]]
    var section = ["A","B","C","D","E","G","H","I","J","M","N","P","S","L","T","U","V"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = (self.loadJson(filename: "countries")?.countries)!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        returnedView.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.size.width, height: 15))
        label.text = self.section[section]
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        returnedView.backgroundColor = .white
         return returnedView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return self.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CountrySportsTableViewCell
        cell.titleLabelName.text = self.countries[indexPath.section][indexPath.row].name
        cell.imageFlag.image = UIImage.init(named: self.countries[indexPath.section][indexPath.row].image)
        cell.CheckBoxMod.isSelected = self.countries[indexPath.section][indexPath.row].checked
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.countries[indexPath.section][indexPath.row].checked = !self.countries[indexPath.section][indexPath.row].checked
        let cell = tableView.cellForRow(at: indexPath) as! CountrySportsTableViewCell
        cell.CheckBoxMod.isSelected = !cell.CheckBoxMod.isSelected
    }
  
    func loadJson(filename fileName: String) -> Countries? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Countries.self, from: data)
                return jsonData
            } catch {
                print("Error Reading Data:\(error)")
            }
        }
        return nil
    }
}
