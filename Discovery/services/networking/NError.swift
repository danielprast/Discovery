//
//  Nerror.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/7/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation


enum ErrorType {
    case invalidUrl(url: String)
    case requestFailure(reason: String)
    case unauthorized
    case internalServerError
    case parsingError
}


class NError: Error {
    
    
    static let shared = NError()
    private init() {}
    
    
    var errorType: ErrorType?
    
    
    public var url: String {
        guard let type = errorType else { return "" }
        switch type {
        case .invalidUrl(let url):
            return url
        default:
            break
        }
        return ""
    }
    
    
    public var errorDescription: String {
        guard let type = errorType else { return "" }
        switch type {
        case .invalidUrl(let url):
            return "Invalid URL format: \(url)"
        case .requestFailure(let reason):
            return reason
        case .unauthorized:
            return "Your credential is invalid."
        case .internalServerError:
            return "Internal server error occured"
        case .parsingError:
            return "Parsing error occured"
        }
    }
    
    
    init(type: ErrorType) {
        self.errorType = type
    }
    
}

