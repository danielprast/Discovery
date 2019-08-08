//
//  NDebug.swift
//  Discovery
//
//  Created by Daniel Prastiwa on 09/08/19.
//  Copyright © 2019 Codenesia. All rights reserved.
//

import Foundation
import RxSwift


class NDebug {
    
    static let userDefautls = UserDefaults.standard
    
    static var isActive: Bool {
        get {
            return userDefautls.bool(forKey: Constant.DEBUG_ACTIVATE)
        }
        set{
            userDefautls.set(newValue, forKey: Constant.DEBUG_ACTIVATE)
        }
    }
    
    static func debug(with logName: String, message: String){
        
        if isActive == true {
            print("😎 \(logName): \(message)")
        }
        
    }
    
    static func shout(_ key: String, _ value: Any) {
        print("😎 \(key): \(value)")
    }
    
}



