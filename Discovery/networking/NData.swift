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
        get{
            var strObj: String?
            data?.filter({ data -> Bool in
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as Any
                return JSONSerialization.isValidJSONObject(json as Any)
            }).flatMap({ data -> Observable<Any> in
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as Any
                return Observable.just(json as Any)
            }).subscribe(onNext: { value in
                guard let jsonObj = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else { return }
                strObj = String(data: jsonObj, encoding: String.Encoding.utf8)
            }).disposed(by: disposeBag)
            
            return NSString(string: strObj!)
        }
    }
    
    init(data: Observable<Data>) {
        self.data = data
    }
}
