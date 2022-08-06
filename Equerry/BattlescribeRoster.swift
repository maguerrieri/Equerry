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

#if DEBUG
            static let test = Result<Self, Error> {
                return try XMLDecoder().decode(Self.self, from: gunhauler.data(using: .utf8)!)
            }
#endif
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

            ScrollView {
                SelectionTester(selection: BattlescribeRoster.Force.Selection.test)
            }
            .previewDisplayName("Selection")
        }
    }
}

fileprivate let gunhauler = """
<selection id="1982-a72e-2281-b8cc" name="Grundstok Gunhauler" entryId="2b89-7fcb-3121-7a2e::fb69-6292-fcca-fba7" number="1" type="unit">
    <profiles>
        <profile id="2b89-7fcb-3121-7a2e::1244-eac5-17c6-a815" name="Grundstok Gunhauler" hidden="false" typeId="1960-ca8e-67ce-2014" typeName="Unit">
            <characteristics>
                <characteristic name="Move" typeId="8655-6213-2824-1752">12&quot;</characteristic>
                <characteristic name="Wounds" typeId="cd0e-fea6-411f-904d">10</characteristic>
                <characteristic name="Bravery" typeId="0c85-bf79-836b-759e">7</characteristic>
                <characteristic name="Save" typeId="f8dd-4f2a-8543-4f36">4+</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::3b70-c749-42d6-1d37" name="Escort Vessel" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">Roll 1 dice each time you allocate a wound or mortal wound to a friendly SKYVESSEL other than a Grundstok Gunhauler while it is within 3&quot; of any friendly Grundstok Gunhaulers. On a 6, that wound or mortal wound is negated.</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::2bae-1f83-570d-68d2" name="Ahead Full" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">Once per battle, at the start of your movement phase, you can say that this model will move ahead full. If you do so, add 6&quot; to the Move characteristic of this model in that phase.</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::3124-2b52-d354-06e8" name="Fly High" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">Instead of making a normal move or retreat with this model, you can say that it will fly high (it can disengage). If you do so, remove this model from the battlefield and set it up again more than 1&quot; from any terrain features or objectives and more than 9&quot; from any enemy models.</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::5cd4-5785-3e7d-f73f::8e0c-cbe4-27be-8a30" name="Fly" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">This unit can fly.</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::3511-d9de-254d-81c5::e557-841e-f594-c1a0" name="Disengage" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">This model and any models in its garrison can still shoot if this model retreats in the same turn, as long as there are no enemy units that can fly within 3&quot; of this model at the start of the retreat move and there are less than 10 wounds allocated to this model at the start of the retreat move.</characteristic>
            </characteristics>
        </profile>
        <profile id="2b89-7fcb-3121-7a2e::c070-89f0-e266-a275::4694-70b9-900d-96ff" name="Bomb Racks" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
            <characteristics>
                <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">At the start of the combat phase, you can pick 1 enemy unit within 1&quot; of this model and roll a dice. Add the Bomb Rack modifier from this model’s damage table to the roll. On a 4+, that enemy unit suffers D3 mortal wounds.</characteristic>
            </characteristics>
        </profile>
    </profiles>
    <selections>
        <selection id="69ae-0769-ea4d-f8b4" name="Aethershot Carbine" entryId="2b89-7fcb-3121-7a2e::54cc-a3db-bc15-1b73" number="1" type="upgrade">
            <profiles>
                <profile id="2b89-7fcb-3121-7a2e::56ae-c901-888b-9719" name="Aethershot Carbine" hidden="false" typeId="96df-ab28-5d72-bbb3" typeName="Weapon">
                    <characteristics>
                        <characteristic name="Type" typeId="655c-362e-a663-3e50">Missile</characteristic>
                        <characteristic name="Range" typeId="ee32-7f8e-ccd7-b7b0">12&quot;</characteristic>
                        <characteristic name="Attacks" typeId="0bd7-bded-a0e0-19a0">2</characteristic>
                        <characteristic name="To Hit" typeId="87f2-fb99-33f9-7269">3+</characteristic>
                        <characteristic name="To Wound" typeId="8842-17f1-9794-4efc">4+</characteristic>
                        <characteristic name="Rend" typeId="f578-d2a5-f0d3-b707">-1</characteristic>
                        <characteristic name="Damage" typeId="b5b6-4cbd-661d-1b70">1</characteristic>
                    </characteristics>
                </profile>
            </profiles>
            <costs>
                <cost name="pts" typeId="points" value="0.0"/>
            </costs>
        </selection>
        <selection id="6c9f-f9cf-274f-363e" name="Boarding Weapons" entryId="2b89-7fcb-3121-7a2e::56a4-ee68-7d25-ffe2" number="1" type="upgrade">
            <profiles>
                <profile id="2b89-7fcb-3121-7a2e::b1bf-c87e-ec53-8170" name="Boarding Weapons" hidden="false" typeId="96df-ab28-5d72-bbb3" typeName="Weapon">
                    <characteristics>
                        <characteristic name="Type" typeId="655c-362e-a663-3e50">Melee</characteristic>
                        <characteristic name="Range" typeId="ee32-7f8e-ccd7-b7b0">1&quot;</characteristic>
                        <characteristic name="Attacks" typeId="0bd7-bded-a0e0-19a0">4</characteristic>
                        <characteristic name="To Hit" typeId="87f2-fb99-33f9-7269">4+</characteristic>
                        <characteristic name="To Wound" typeId="8842-17f1-9794-4efc">4+</characteristic>
                        <characteristic name="Rend" typeId="f578-d2a5-f0d3-b707">-</characteristic>
                        <characteristic name="Damage" typeId="b5b6-4cbd-661d-1b70">1</characteristic>
                    </characteristics>
                </profile>
            </profiles>
            <costs>
                <cost name="pts" typeId="points" value="0.0"/>
            </costs>
        </selection>
        <selection id="1eda-5ad3-d8b9-ee30" name="Battle Regiment - 2-5 Troops" entryId="2b89-7fcb-3121-7a2e::bc75-2995-e91f-2dec::23a9-c2e0-1f6e-9f37::4df0-9610-3fc2-96df" entryGroupId="2b89-7fcb-3121-7a2e::bc75-2995-e91f-2dec::23a9-c2e0-1f6e-9f37::ae0b-b64b-5064-0103" number="1" type="upgrade">
            <costs>
                <cost name="pts" typeId="points" value="0.0"/>
            </costs>
        </selection>
        <selection id="5542-6d99-88d6-09ff" name="3. Coalbeard&apos;s Collapsible Compartments" entryId="2b89-7fcb-3121-7a2e::8316-90e4-97b3-aaee::bc33-0dee-fc62-0a1d" entryGroupId="2b89-7fcb-3121-7a2e::8316-90e4-97b3-aaee::2654-0490-7d11-7115" number="1" type="upgrade">
            <profiles>
                <profile id="2b89-7fcb-3121-7a2e::8316-90e4-97b3-aaee::e68b-1535-fe26-be26" name="Coalbeard&apos;s Collapsible Compartments" hidden="false" typeId="0ac4-aacb-2481-8e72" typeName="Artefact">
                    <characteristics>
                        <characteristic name="Artefact Details" typeId="0918-c47a-d84e-c0cf">This model can use the Flying Transport ability from the Arkanaut Ironclad warscroll. If it does so, the maximum number of models that can garrison it is 5 instead of 25, and it can always fly high and/ or disengage no matter how many models are in its garrison.</characteristic>
                    </characteristics>
                </profile>
            </profiles>
            <costs>
                <cost name="pts" typeId="points" value="0.0"/>
            </costs>
        </selection>
        <selection id="c626-8f76-e664-5f6e" name="Sky Cannon" entryId="2b89-7fcb-3121-7a2e::9e7b-433a-6809-9733" entryGroupId="2b89-7fcb-3121-7a2e::6e06-671d-0cdc-9cb8" number="1" type="upgrade">
            <profiles>
                <profile id="2b89-7fcb-3121-7a2e::18aa-c0f5-c7e2-0903" name="Sky Cannon: Shrapnel" hidden="false" typeId="96df-ab28-5d72-bbb3" typeName="Weapon">
                    <characteristics>
                        <characteristic name="Type" typeId="655c-362e-a663-3e50">Missile</characteristic>
                        <characteristic name="Range" typeId="ee32-7f8e-ccd7-b7b0">18&quot;</characteristic>
                        <characteristic name="Attacks" typeId="0bd7-bded-a0e0-19a0">D6</characteristic>
                        <characteristic name="To Hit" typeId="87f2-fb99-33f9-7269">3+</characteristic>
                        <characteristic name="To Wound" typeId="8842-17f1-9794-4efc">3+</characteristic>
                        <characteristic name="Rend" typeId="f578-d2a5-f0d3-b707">-1</characteristic>
                        <characteristic name="Damage" typeId="b5b6-4cbd-661d-1b70">2</characteristic>
                    </characteristics>
                </profile>
                <profile id="2b89-7fcb-3121-7a2e::9eaa-7d1d-5d7c-35b9" name="Sky Cannon" hidden="false" typeId="c924-5a68-471a-2fd5" typeName="Unit Abilities">
                    <characteristics>
                        <characteristic name="Ability Details" typeId="d4dc-8e81-bc0e-b8f0">Before attacking with a Sky Cannon, choose either the Shrapnel or Shell missile weapon characteristics for that shooting attack.</characteristic>
                    </characteristics>
                </profile>
                <profile id="2b89-7fcb-3121-7a2e::f1d9-d5d9-c510-2dd1" name="Sky Cannon: Shell" hidden="false" typeId="96df-ab28-5d72-bbb3" typeName="Weapon">
                    <characteristics>
                        <characteristic name="Type" typeId="655c-362e-a663-3e50">Missile</characteristic>
                        <characteristic name="Range" typeId="ee32-7f8e-ccd7-b7b0">24&quot;</characteristic>
                        <characteristic name="Attacks" typeId="0bd7-bded-a0e0-19a0">1</characteristic>
                        <characteristic name="To Hit" typeId="87f2-fb99-33f9-7269">3+</characteristic>
                        <characteristic name="To Wound" typeId="8842-17f1-9794-4efc">2+</characteristic>
                        <characteristic name="Rend" typeId="f578-d2a5-f0d3-b707">-2</characteristic>
                        <characteristic name="Damage" typeId="b5b6-4cbd-661d-1b70">D6</characteristic>
                    </characteristics>
                </profile>
            </profiles>
            <costs>
                <cost name="pts" typeId="points" value="0.0"/>
            </costs>
        </selection>
    </selections>
    <costs>
        <cost name="pts" typeId="points" value="155.0"/>
    </costs>
    <categories>
        <category id="5ae5-cb67-5c71-0d49" name="DUARDIN" entryId="945b-2f5e-58f0-75e2" primary="false"/>
        <category id="3557-853f-5165-21b3" name="GRUNDSTOK GUNHAULER" entryId="c1ae-4be7-121f-de8d" primary="false"/>
        <category id="28c7-135a-0d3d-c0ef" name="SKYVESSEL" entryId="5528-5663-ecec-7274" primary="false"/>
        <category id="0e9c-0e3d-6124-f486" name="WAR MACHINE" entryId="880e-1e33-b965-71ec" primary="false"/>
        <category id="d56b-06c2-9e84-774c" name="KHARADRON OVERLORDS" entryId="2654-58fb-a46f-b28d" primary="false"/>
        <category id="faef-c30e-e730-8b94" name="ORDER" entryId="b970-b3bf-e1a4-a6fc" primary="false"/>
        <category id="c21a-1954-a843-7427" name="Other" entryId="065e-fda7-fd27-1f40" primary="false"/>
        <category id="3e1b-49ad-83b7-0396" name="Battleline" entryId="e9f2-765a-b7b8-ce8e" primary="true"/>
    </categories>
</selection>
"""
#endif
