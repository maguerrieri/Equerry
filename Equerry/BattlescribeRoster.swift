//
//  BattlescribeRoster.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI

import XMLCoder

fileprivate enum NodeCoding {
    case attribute
    case element
}

fileprivate extension XMLDecoder.NodeDecoding {
    init(_ coding: NodeCoding) {
        switch coding {
            case .attribute:
                self = .attribute
            case .element:
                self = .element
        }
    }
}

fileprivate extension XMLEncoder.NodeEncoding {
    init(_ coding: NodeCoding) {
        switch coding {
            case .attribute:
                self = .attribute
            case .element:
                self = .element
        }
    }
}

fileprivate protocol DynamicNodeCoding: DynamicNodeDecoding, DynamicNodeEncoding {
    static func nodeCoding(for key: CodingKey) -> NodeCoding
}

extension DynamicNodeCoding {
    static func nodeDecoding(for key: CodingKey) -> XMLDecoder.NodeDecoding {
        return .init(Self.nodeCoding(for: key))
    }
    static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .init(Self.nodeCoding(for: key))
    }
}

struct BattlescribeRoster: Codable, DynamicNodeCoding, Identifiable {
    let id: String
    let name: String

    let forces: Forces

    struct Forces: Codable {
        let force: [Force]
    }
    struct Force: Codable, DynamicNodeCoding, Identifiable {
        let id: String
        let name: String

        let selections: Selections

        let categories: Categories?

        struct Selections: Codable {
            let selection: [Selection]
        }
        struct Selection: Codable, DynamicNodeCoding, Identifiable {
            let id: String
            let name: String

            let profiles: Profiles?
            let selections: Selections?

            let categories: Categories?

            struct Profiles: Codable {
                let profile: [Profile]
            }
            struct Profile: Codable, DynamicNodeCoding, Identifiable {
                let id: String
                let name: String

                enum `Type`: String, Codable {
                    case abilities = "Abilities"
                    case artefact = "Artefact"
                    case battalionAbility = "Battalion Abilities"
                    case battalionOrganization = "Battalion Organisation"
                    case battleTactic = "Battle Tactic"
                    case battleTrait = "Battle Trait"
                    case commandAbility = "Command Abilities"
                    case commandTrait = "Command Trait"
                    case grandStrategy = "Grand Strategy"
                    case kharadronArtycle = "1) Artycle"
                    case kharadronAmendment = "2) Amendment"
                    case kharadronFootnote = "3) Footnote"
                    case specialRule = "Special Rules"
                    case spell = "Spell"
                    case weapon = "Weapon"
                    case unit = "Unit"
                    case unitAbility = "Unit Abilities"
                }
                let type: `Type`

                let characteristics: Characteristics

                struct Characteristics: Codable {
                    let characteristic: [Characteristic]
                }
                struct Characteristic: Codable {
                    let name: String
                    let value: String

                    enum CodingKeys: String, CodingKey {
                        case name
                        case value = ""
                    }
                }

                enum CodingKeys: String, CodingKey {
                    case id
                    case name

                    case type = "typeName"

                    case characteristics
                }

                fileprivate static func nodeCoding(for key: CodingKey) -> NodeCoding {
                    switch key {
                        case CodingKeys.id, CodingKeys.name, CodingKeys.type:
                            return .attribute
                        default:
                            return .element
                    }
                }
            }

            enum CodingKeys: String, CodingKey {
                case id
                case name

                case profiles
                case selections
                case categories
            }

            fileprivate static func nodeCoding(for key: CodingKey) -> NodeCoding {
                switch key {
                    case CodingKeys.id, CodingKeys.name:
                        return .attribute
                    default:
                        return .element
                }
            }
        }

        struct Categories: Codable {
            let category: [Category]
        }
        struct Category: Codable, Identifiable {
            let id: String
            let name: String
        }

        enum CodingKeys: String, CodingKey {
            case id
            case name

            case selections
            case categories
        }

        fileprivate static func nodeCoding(for key: CodingKey) -> NodeCoding {
            switch key {
                case CodingKeys.id, CodingKeys.name:
                    return .attribute
                default:
                    return .element
            }
        }

#if DEBUG
        static let test = Result<Self, Error> {
            let testXML =
"""
<force id="ccc1-75f4-c775-76eb" name="**Pitched Battle GHB 2022** 1,000" entryId="1411-460f-c135-a667" catalogueId="e23c-3deb-f35c-8104" catalogueRevision="38" catalogueName="Order - Kharadron Overlords">
    <selections>
        <selection id="5c41-69c8-4bee-2c7e" name="Core Battalion: Battle Regiment" entryId="eb9a-ad10-f507-1b3a::1878-56e2-2862-8da5" number="1" type="upgrade">
            <profiles>
                <profile id="eb9a-ad10-f507-1b3a::367e-fa52-1a3d-0684" name="Core Battalion: Battle Regiment" hidden="false" typeId="75e0-a332-e4f5-bf36" typeName="Battalion Organisation">
                    <characteristics>
                        <characteristic name="Required" typeId="eb5f-e9d2-e457-bff5">1 Commander
0-2 Sub-commanders
2-5 Troops
0-1 Monster or Artillery</characteristic>
                    </characteristics>
                </profile>
                <profile id="eb9a-ad10-f507-1b3a::2dca-6135-9464-0728::9439-c5f6-945d-2d65" name="Unified" hidden="false" typeId="bdc6-78da-3796-60a3" typeName="Battalion Abilities">
                    <characteristics>
                        <characteristic name="Battalion Ability Details" typeId="08e0-9ead-1dbe-c801">One-drop Deployment (see 26.2.1).</characteristic>
                    </characteristics>
                </profile>
            </profiles>
        </selection>
    </selections>
</force>
"""
            return try XMLDecoder().decode(Self.self, from: testXML.data(using: .utf8)!)
        }
#endif
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case forces
    }

    fileprivate static func nodeCoding(for key: CodingKey) -> NodeCoding {
        switch key {
            case CodingKeys.name:
                return .attribute
            case CodingKeys.forces:
                return .element
            default:
                return .attribute
        }
    }

#if DEBUG
    fileprivate enum DebugError: Error {
        case testRosterMissing
    }

    static let test = Result<Self, Error> {
        if let url = Bundle.main.url(forResource: "1000-kharadron", withExtension: "ros") {
            return try XMLDecoder().decode(Self.self, from: .init(contentsOf: url))
        } else {
            throw DebugError.testRosterMissing
        }
    }
#endif
}

#if DEBUG
struct BattlescribeRoster_Previews: PreviewProvider {
    private struct ProfileTester: View {
        let profile: BattlescribeRoster.Force.Selection.Profile

        var body: some View {
            Text(self.profile.name)

            Text(self.profile.type.rawValue)

            ForEach(self.profile.characteristics.characteristic, id: \.name) { characteristic in
                Text("\(characteristic.name): \(characteristic.value)")
            }
        }
    }

    private struct CategoriesTester: View {
        let categories: [BattlescribeRoster.Force.Category]

        var body: some View {
            LazyVGrid(columns: [.init(.adaptive(minimum: 100))]) {
                ForEach(self.categories) { category in
                    Text(category.name)
                        .multilineTextAlignment(.center)
                        .padding(3)
                        .background { RoundedRectangle(cornerRadius: 5).fill(.thinMaterial) }
                        .padding(.vertical, 1)
                }
            }
        }
    }

    private struct SelectionTester: View {
        let selection: Result<BattlescribeRoster.Force.Selection, Error>

        var body: some View {
            switch self.selection {
                case .success(let selection):
                    VStack {
                        Text(selection.name)
                            .font(.title3)

                        if let profiles = selection.profiles {
                            ForEach(profiles.profile) { profile in
                                ProfileTester(profile: profile)
                            }
                        }

                        if let selections = selection.selections {
                            ForEach(selections.selection) { selection in
                                SelectionTester(selection: .success(selection))
                            }
                        }

                        if let categories = selection.categories {
                            CategoriesTester(categories: categories.category)
                        }
                    }
                case .failure(let error):
                    Text("\(String(reflecting: error))")
            }
        }
    }

    private struct ForceTester: View {
        let force: Result<BattlescribeRoster.Force, Error>

        var body: some View {
            switch self.force {
                case .success(let force):
                    VStack {
                        Text(force.name)
                            .font(.title2)

                        ForEach(force.selections.selection) { selection in
                            SelectionTester(selection: .success(selection))
                        }

                        if let categories = force.categories {
                            CategoriesTester(categories: categories.category)
                        }
                    }
                case .failure(let error):
                    Text("\(String(reflecting: error))")
            }
        }
    }

    private struct RosterTester: View {
        var body: some View {
            switch BattlescribeRoster.test {
                case .success(let roster):
                    VStack {
                        Text(roster.name)
                            .font(.title)

                        ForEach(roster.forces.force) { force in
                            ForceTester(force: .success(force))
                        }
                    }
                case .failure(let error):
                    Text("\(String(reflecting: error))")
            }
        }
    }

    static var previews: some View {
        Group {
            ScrollView {
                RosterTester()
            }
            .previewDisplayName("Roster")

            ScrollView {
                ForceTester(force: BattlescribeRoster.Force.test)
            }
            .previewDisplayName("Force")
        }
    }
}
#endif
