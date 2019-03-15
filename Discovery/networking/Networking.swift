//
//  Networking.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/7/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation
import RxSwift

extension String {
    
    func isValidURL() throws -> URL? {
        guard let url = URL(string: self) else {
            let error = NError(type: .urlNotValid(url: self))
            throw error
        }
        return url
    }
}

class Networking {
    
    //singleton
    static let sharedInstance = Networking()
    
    //URLSession
    private let defaultSession = URLSession(configuration: .default)
    
    //URLSessionTask
    private var dataTask: URLSessionDataTask?
    private let downloadTask: URLSessionDownloadTask? = nil
    private let uploadTask: URLSessionUploadTask? = nil
    
    func requestData(withUrl urlPath: String, completion: @escaping(Result<NData, NError>) -> Void){
        
        dataTask?.cancel()
        
        guard let url = try? urlPath.isValidURL() else { return }
        
        dataTask = defaultSession.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            if let response = response as? HTTPURLResponse, let data = data {
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    let ndata = NData(data: Observable.just(data))
                    completion(.success(ndata))
                } else if response.statusCode == 500 {
                    let error = NError()
                    error.errorType = ErrorType.internalServerError
                    completion(.failure(error))
                }
            }
            
        })
        
        dataTask?.resume()
        
    }
    
}
