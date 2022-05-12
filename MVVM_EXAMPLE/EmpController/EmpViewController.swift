//
//  ViewController.swift
//  MVVM_EXAMPLE
//
//  Created by wajeeh hassan on 11/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var employeeViewModel : EmployeesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        callToViewModelForDataAndUpdateUI()
    }
    
    func callToViewModelForDataAndUpdateUI(){
        
        self.employeeViewModel =  EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {

            self.tableView.reloadData()
            
        }
    }

}



extension ViewController: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = EmpCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
        let obj = employeeViewModel.empData?[indexPath.row]
        cell.nameLable.text = obj?.title ?? ""
        cell.salaryLable.text = "\(obj?.id ?? 0)"

        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.empData?.count ?? 0
    }
    
    

 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
    }
      
    
}

