//
//  BattlescribeFile.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI

import XMLCoder

struct BattlescribeDocument: Codable/*, FileDocument*/ {
//    static var readableContentTypes: [UTType] { [ .xml ] }

    let name: String

//    enum Error: Swift.Error {
//        case cannotReadFile
//        case writeNotSupported
//    }
//
//    init(configuration: ReadConfiguration) throws {
//        if let contents = configuration.file.regularFileContents {
//            self = try XMLDecoder().decode(Self.self, from: contents)
//        } else {
//            throw Error.cannotReadFile
//        }
//    }
//
//    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
//        throw Error.writeNotSupported
//    }
}
