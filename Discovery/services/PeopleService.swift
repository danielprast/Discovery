//
//  PeopleService.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/7/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation

class PeopleService {
    
    let baseURL = "http://0.0.0.0:5000/api/"
    
    func getPeople(){
        let get_people = "people"
    
        let urlPath = baseURL.appending(get_people)
        
        Networking.sharedInstance.requestData(url: urlPath,
                                              method: .get,
                                              headers: nil,
                                              parameters: nil)
        { (result: RequestResult<NData, NError>) in
            
        }
        
        /*Networking.sharedInstance.requestData(withUrl: urlPath) { completion in
            switch completion {
            case .success(let data):
                print(data.jsonString)
                break
            case .failure(let error):
                print(error.errorDescription)
                break
            }
        }*/
    }
    
    func getPopleByName(){
        
    }
    
    func addPeople(){
        
    }
    
    func updatePeople(){
        
    }
    
    func deletePeople(){
        
    }
    
}
