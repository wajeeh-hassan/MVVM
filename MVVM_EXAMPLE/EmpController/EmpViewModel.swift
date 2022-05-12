//
//  NewsViewModel.swift
//  MVVM_EXAMPLE
//
//  Created by wajeeh hassan on 11/05/2022.
//

import Foundation

class EmployeesViewModel : NSObject {
    
    private var apiService : APIService!
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    private(set) var empData : [Employees]? {
        didSet {
        }
    }
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            self.empData = empData
            DispatchQueue.main.async {
                self.bindEmployeeViewModelToController()
            }
        }
    }
}
