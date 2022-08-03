//
//  Result.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import Foundation

extension Result {
    var value: Success {
        get throws {
            switch self {
                case .success(let success):
                    return success
                case .failure(let failure):
                    throw failure
            }
        }
    }
}
