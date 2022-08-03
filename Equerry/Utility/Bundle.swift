//
//  Bundle.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import Foundation

extension Bundle {
    var bundleName: String {
        return self.localizedInfoDictionary?[kCFBundleNameKey as String] as? String ?? "Equerry"
    }
}
