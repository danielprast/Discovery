//
//  Nerror.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/7/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation

enum ErrorType {
    case urlNotValid(url: String)
    case unauthorized
    case internalServerError
}

class NError: Error {
    
    static let shared = NError()

    var errorType: ErrorType?
    
    public var url: String {
        guard let type = errorType else { return "" }
        switch type {
        case .urlNotValid(let url):
            return url
        default: break
        }
        return ""
    }
    
    var errorDescription: String {
        guard let type = errorType else { return "" }
        switch type {
        case .urlNotValid(let url):
            return "Invalid url \(url)"
        case .unauthorized:
            return "Your are not allowed here"
        case .internalServerError:
            return "Sorry server not available"
        }
    }

    
    init() {
        
    }
    
    init(type: ErrorType) {
        self.errorType = type
    }
}

