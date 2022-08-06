//
//  RootView.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import SwiftUI

import XMLCoder

struct RootView: View {
    @State private var presentFileImporter = false

    @State private var document: BattlescribeRoster? = nil

    var body: some View {
        NavigationStack {
            VStack {
                Button("Test") { self.presentFileImporter = true }
                    .fileImporter(isPresented: self.$presentFileImporter,
                                  allowedContentTypes: [ .init(filenameExtension: "ros")! ]) { result in
                        do {
                            let url = try result.value
                            if url.startAccessingSecurityScopedResource() {
                                self.document = try XMLDecoder().decode(BattlescribeRoster.self,
                                                                        from: .init(contentsOf: url))
                                url.stopAccessingSecurityScopedResource()
                            }
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }

                if let document {
                    Text(document.name)
                }
            }
        }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
