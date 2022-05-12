//
//  WebService.swift
//  MVVM_EXAMPLE
//
//  Created by wajeeh hassan on 11/05/2022.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    func apiToGetEmployeeData(completion : @escaping ([Employees]) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
               let empData = try! jsonDecoder.decode([Employees].self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}
