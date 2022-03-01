//
//  ViewController.swift
//  Booking
//
//  Created by Денис Денисов on 20.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var wrapperView: UIView!
    
    var offices: [String] = [
        "Офис в Ульяновске",
        "Офис в Димитровграде",
        "Офис в Самаре",
        "Офис в Казани",
        "Офис в Лос-Анджелосе",
        "Офис в Санкт Петербурге",
        "Офис в Лондоне",
        "Офис в Калининграде",
        "Офис в Сан Франциско",
        "Офис в Париже"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.OfficeCell.nibName, bundle: nil),
                           forCellReuseIdentifier: K.OfficeCell.reuseId)
        wrapperView.dropShadow()
    }
    @IBAction func downButtonPressed(_ sender: UIButton) {
        scrollToBottom()
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.offices.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}




extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offices.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var returnedCell = UITableViewCell()
        
        if indexPath.row != self.offices.count {
            if let cell = tableView.dequeueReusableCell(withIdentifier: K.OfficeCell.reuseId) as? OfficeCell {
                cell.OfficeLabel.text = String(indexPath.row + 1) + ". " + offices[indexPath.row]
                returnedCell = cell
            }
        }
        return returnedCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
}
}
