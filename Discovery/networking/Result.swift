//
//  Result.swift
//  LearnIOS
//
//  Created by Ilham Hadi Prabawa on 3/15/19.
//  Copyright © 2019 Ilham Hadi Prabawa. All rights reserved.
//

import Foundation

enum Result<D, E: Error> {
    case success(D)
    case failure(E)
}
