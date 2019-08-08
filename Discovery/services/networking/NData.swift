//
//  NData.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/15/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation
import RxSwift


class NData {
    
    
    private var disposeBag = DisposeBag()
    private var data: Observable<Data>?
    
    
    public var jsonString: NSString {
        get {
            var strJson: String?
            data?.filter({ data -> Bool in
                let json = self.jsonSerialize(data)
                return JSONSerialization.isValidJSONObject(json as Any)
            }).flatMap({ (data) -> Observable<Any> in
                let json = self.jsonSerialize(data)
                return Observable.just(json as Any)
            }).subscribe(onNext: { value in
                guard
                    let jsonObj = try? JSONSerialization
                        .data(withJSONObject: value, options: .prettyPrinted)
                    else { return }
                strJson = String(data: jsonObj, encoding: String.Encoding.utf8)
            }).disposed(by: disposeBag)
            
            return NSString(string: strJson ?? "")
        }
    }
    
    
    public var jsonData: Data? {
        get {
            guard let str = jsonString as String? else { return nil }
            return str.data(using: String.Encoding.utf8)
        }
    }
    
    
    init(data: Observable<Data>) {
        self.data = data
    }
    
    
    func jsonSerialize(_ data: Data, _ options: JSONSerialization.ReadingOptions = []) -> Any? {
        return try? JSONSerialization.jsonObject(with: data, options: options) as Any
    }
    
    
    func jsonDecode<T: Codable>(_ data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let err {
            NDebug.shout("Decoding Error", "Failed to decode json: \(err.localizedDescription)")
        }
        
        return nil
    }
    
}
