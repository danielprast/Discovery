//
//  EmployeeService.swift
//  Discovery
//
//  Created by Daniel Prastiwa on 09/08/19.
//  Copyright © 2019 Codenesia. All rights reserved.
//

import Foundation


class EmployeeService {
    // docs: dummy.restapiexample.com
    
    let baseURL = "http://dummy.restapiexample.com/api/v1/"
    
    let employeePath = "employees"
    
    
    /// Get all employees data
    func getEmployees(failure: ((String) -> ())?, completion: @escaping () -> ()) {
        let url = baseURL.appending(employeePath)
        
        Networking.sharedInstance.requestGet(withUrl: url)
        { (result: RequestResult<NData, NError>) in
            switch result {
            case .success(let ndata):
                NDebug.shout("All employees", ndata.jsonString)
                completion()
                break
            case .failure(let err):
                NDebug.shout("Failed to get all employees", err.errorDescription)
                failure?(err.errorDescription)
                break
            }
        }
    }
    
}
