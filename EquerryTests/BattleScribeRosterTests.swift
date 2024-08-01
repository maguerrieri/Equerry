//
//  BattleScribeRosterTests.swift
//  EquerryTests
//
//  Created by Mario Guerrieri on 9/5/23.
//

@testable import Equerry

import Testing
import XMLCoder

extension BattlescribeRoster.Force.Selection {
    static private func test(xmlString: String) -> Result<Self, Error> {
        return .init { try XMLDecoder().decode(Self.self, from: xmlString.data(using: .utf8)!) }
    }
    static let aosTest = test(xmlString: """
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
""")
    static let fortyKTest = test(xmlString: """
<selection id="20d2-b8d0-a3cd-e0df" name="Bladeguard Veteran Squad" entryId="72e3-6e4f-f052-b1a7::0da5-bbc7-769c-7ae4" number="1" type="unit">
  <rules>
    <rule id="72e3-6e4f-f052-b1a7::2008-4632-5dd5-4bac::01a4-bec8-b573-fde7" name="Angels of Death" hidden="false">
      <description>This unit has the following abilities: And They Shall Know No Fear, Bolter Discipline, Shock Assault and Combat Doctrines.</description>
    </rule>
    <rule id="72e3-6e4f-f052-b1a7::8066-b9da-65c3-005b::af4f-5849-3bd3-e2fd" name="Combat Squads" hidden="false">
      <description>Before any models are deployed at the start of the game, this unit when containing its maximum number of models, may be split into two units each containing an equal number of models.</description>
    </rule>
  </rules>
  <selections>
    <selection id="b6bd-1026-e6e9-f70c" name="Bladeguard Veteran" entryId="72e3-6e4f-f052-b1a7::44e2-8770-dd06-b25a" entryGroupId="72e3-6e4f-f052-b1a7::a4aa-7346-799e-57e1" number="4" type="model">
      <profiles>
        <profile id="72e3-6e4f-f052-b1a7::ae74-898b-cbf6-38a5" name="Bladeguard Veteran" hidden="false" typeId="800f-21d0-4387-c943" typeName="Unit">
          <characteristics>
            <characteristic name="M" typeId="0bdf-a96e-9e38-7779">6&quot;</characteristic>
            <characteristic name="WS" typeId="e7f0-1278-0250-df0c">3+</characteristic>
            <characteristic name="BS" typeId="381b-eb28-74c3-df5f">3+</characteristic>
            <characteristic name="S" typeId="2218-aa3c-265f-2939">4</characteristic>
            <characteristic name="T" typeId="9c9f-9774-a358-3a39">4</characteristic>
            <characteristic name="W" typeId="f330-5e6e-4110-0978">3</characteristic>
            <characteristic name="A" typeId="13fc-b29b-31f2-ab9f">3</characteristic>
            <characteristic name="Ld" typeId="00ca-f8b8-876d-b705">8</characteristic>
            <characteristic name="Save" typeId="c0df-df94-abd7-e8d3">3+</characteristic>
          </characteristics>
        </profile>
      </profiles>
      <selections>
        <selection id="fc34-b518-dfd0-1853" name="Storm Shield" entryId="72e3-6e4f-f052-b1a7::ead5-18ef-86a9-8ce6" number="4" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::7c98-e3c6-057b-cd6e::541d-ade9-7496-9c62" name="Storm shield" hidden="false" typeId="72c5eafc-75bf-4ed9-b425-78009f1efe82" typeName="Abilities">
              <characteristics>
                <characteristic name="Description" typeId="21befb24-fc85-4f52-a745-64b2e48f8228">The bearer has a 4+ invulnerable save. In addition, add 1 to armour saving throws made for the bearer.</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
          </costs>
        </selection>
        <selection id="ddce-2525-68ef-47da" name="Frag &amp; Krak grenades" entryId="72e3-6e4f-f052-b1a7::9e5f-8861-e4a6-6596::cddf-945e-1335-e681" number="4" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::9e5f-8861-e4a6-6596::61a4-e2d3-522d-c838::fdd8-1a5f-5722-d6ee" name="Frag grenades" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">6&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Grenade D6</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">3</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">0</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">1</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">Blast.</characteristic>
              </characteristics>
            </profile>
            <profile id="72e3-6e4f-f052-b1a7::9e5f-8861-e4a6-6596::b250-1f2e-4904-0eb4::3bf6-b4f7-6b2f-bb7b" name="Krak grenades" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">6&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Grenade 1</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">6</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">-1</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">D3</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">-</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name="pts" typeId="points" value="0.0"/>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
          </costs>
        </selection>
        <selection id="894b-04a7-f182-ce3b" name="Heavy Bolt Pistol" entryId="72e3-6e4f-f052-b1a7::69b6-d6dc-a30e-736b::e4cc-d26c-05a8-9eac" number="4" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::69b6-d6dc-a30e-736b::7348-43bc-0765-54df::206b-edd4-0d52-d873" name="Heavy Bolt Pistol" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">18&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Pistol 1</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">4</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">-1</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">1</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">-</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
          </costs>
        </selection>
        <selection id="6353-b91d-ff8b-90a9" name="Master-crafted power sword" entryId="72e3-6e4f-f052-b1a7::5718-1030-95b4-6c4f::c754-9c52-a162-2032" number="4" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::5718-1030-95b4-6c4f::00a5-eea5-15f4-b2e8::4dff-d8cf-a1b1-567e" name="Master-crafted power sword" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">Melee</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Melee</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">+1</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">-3</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">2</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">-</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
          </costs>
        </selection>
      </selections>
      <costs>
        <cost name="pts" typeId="points" value="140.0"/>
        <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
        <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
      </costs>
    </selection>
    <selection id="bedb-6b7f-2e21-dd25" name="Bladeguard Veteran Sergeant" entryId="72e3-6e4f-f052-b1a7::1c76-12ee-46e3-dab6" entryGroupId="72e3-6e4f-f052-b1a7::a4aa-7346-799e-57e1" number="1" type="model">
      <profiles>
        <profile id="72e3-6e4f-f052-b1a7::027e-4853-291b-40ad" name="Bladeguard Veteran Sergeant" hidden="false" typeId="800f-21d0-4387-c943" typeName="Unit">
          <characteristics>
            <characteristic name="M" typeId="0bdf-a96e-9e38-7779">6&quot;</characteristic>
            <characteristic name="WS" typeId="e7f0-1278-0250-df0c">3+</characteristic>
            <characteristic name="BS" typeId="381b-eb28-74c3-df5f">3+</characteristic>
            <characteristic name="S" typeId="2218-aa3c-265f-2939">4</characteristic>
            <characteristic name="T" typeId="9c9f-9774-a358-3a39">4</characteristic>
            <characteristic name="W" typeId="f330-5e6e-4110-0978">3</characteristic>
            <characteristic name="A" typeId="13fc-b29b-31f2-ab9f">4</characteristic>
            <characteristic name="Ld" typeId="00ca-f8b8-876d-b705">9</characteristic>
            <characteristic name="Save" typeId="c0df-df94-abd7-e8d3">3+</characteristic>
          </characteristics>
        </profile>
      </profiles>
      <selections>
        <selection id="a447-984c-1f63-8013" name="Storm Shield" entryId="72e3-6e4f-f052-b1a7::be3d-737d-fb20-dfcd" number="1" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::d28b-a40c-543f-9241::541d-ade9-7496-9c62" name="Storm shield" hidden="false" typeId="72c5eafc-75bf-4ed9-b425-78009f1efe82" typeName="Abilities">
              <characteristics>
                <characteristic name="Description" typeId="21befb24-fc85-4f52-a745-64b2e48f8228">The bearer has a 4+ invulnerable save. In addition, add 1 to armour saving throws made for the bearer.</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
          </costs>
        </selection>
        <selection id="00b8-80ad-abf6-99ba" name="Frag &amp; Krak grenades" entryId="72e3-6e4f-f052-b1a7::c085-9380-de8c-12c0::cddf-945e-1335-e681" number="1" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::c085-9380-de8c-12c0::61a4-e2d3-522d-c838::fdd8-1a5f-5722-d6ee" name="Frag grenades" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">6&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Grenade D6</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">3</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">0</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">1</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">Blast.</characteristic>
              </characteristics>
            </profile>
            <profile id="72e3-6e4f-f052-b1a7::c085-9380-de8c-12c0::b250-1f2e-4904-0eb4::3bf6-b4f7-6b2f-bb7b" name="Krak grenades" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">6&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Grenade 1</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">6</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">-1</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">D3</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">-</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name="pts" typeId="points" value="0.0"/>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
          </costs>
        </selection>
        <selection id="e53c-fb41-bd02-b190" name="Master-crafted power sword" entryId="72e3-6e4f-f052-b1a7::209a-5ce5-a9f5-cfad::2500-aed6-f77e-88f9" number="1" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::209a-5ce5-a9f5-cfad::748c-8850-d505-25c1::4dff-d8cf-a1b1-567e" name="Master-crafted power sword" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">Melee</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Melee</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">+1</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">-3</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">2</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">-</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
          </costs>
        </selection>
        <selection id="98ce-5da9-8b41-eba7" name="Neo-volkite pistol" entryId="72e3-6e4f-f052-b1a7::9e2b-343b-a86a-771b::4c4c-c7e5-9be9-b74e" entryGroupId="72e3-6e4f-f052-b1a7::825b-baf0-4865-3adf" number="1" type="upgrade">
          <profiles>
            <profile id="72e3-6e4f-f052-b1a7::9e2b-343b-a86a-771b::b300-fe65-5bf8-d9d8" name="Neo-volkite pistol" hidden="false" typeId="d5f97c0b-9fc9-478d-aa34-a7c414d3ea48" typeName="Weapon">
              <characteristics>
                <characteristic name="Range" typeId="6fa97fa8-ea74-4a27-a0fb-bc4e5f367464">15&quot;</characteristic>
                <characteristic name="Type" typeId="077c342f-d7b9-45c6-b8af-88e97cafd3a2">Pistol 2</characteristic>
                <characteristic name="S" typeId="59b1-319e-ec13-d466">5</characteristic>
                <characteristic name="AP" typeId="75aa-a838-b675-6484">0</characteristic>
                <characteristic name="D" typeId="ae8a-3137-d65b-4ca7">2</characteristic>
                <characteristic name="Abilities" typeId="837d-5e63-aeb7-1410">Each unmodified wound roll of 6 inflicts 1 mortal wound on the target in addition to any other damage</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <costs>
            <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
            <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
            <cost name="pts" typeId="points" value="0.0"/>
          </costs>
        </selection>
      </selections>
      <costs>
        <cost name="pts" typeId="points" value="35.0"/>
        <cost name=" PL" typeId="e356-c769-5920-6e14" value="0.0"/>
        <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
      </costs>
    </selection>
  </selections>
  <costs>
    <cost name=" PL" typeId="e356-c769-5920-6e14" value="10.0"/>
    <cost name="CP" typeId="2d3b-b544-ad49-fb75" value="0.0"/>
    <cost name="pts" typeId="points" value="0.0"/>
  </costs>
  <categories>
    <category id="1e8f-099f-a7ba-8ad3" name="Faction: Imperium" entryId="84e2-9fa9-ebe6-1d18" primary="false"/>
    <category id="192f-3c40-f946-5d98" name="Faction: Adeptus Astartes" entryId="c7b7-edbc-bc14-6238" primary="false"/>
    <category id="00d8-7c45-5092-a640" name="Infantry" entryId="3d52-fccf-10c0-3fae" primary="false"/>
    <category id="c2ed-3683-e5fd-cdc5" name="Bladeguard" entryId="a75d-f182-c709-c6de" primary="false"/>
    <category id="3fd2-175f-77aa-808a" name="Primaris" entryId="53b7-cff3-c3b4-d36a" primary="false"/>
    <category id="fc69-d9fa-0195-cd93" name="Bladeguard Veteran Squad" entryId="fd91-c1b7-6e5e-ced1" primary="false"/>
    <category id="e8b6-d853-2cd5-cced" name="Core" entryId="08f1-d244-eb44-7e01" primary="false"/>
    <category id="2d70-373b-50f7-f9da" name="Elites" entryId="638d74c6-bd97-4de5-b65a-6aaa24e9f4b2" primary="true"/>
  </categories>
</selection>
""")
}

struct BattleScribeRosterTests {
    @Test func testAoSSelection() throws {
        let selection = try BattlescribeRoster.Force.Selection.aosTest.get()

        #expect(selection.categories?.category.first?.name == "DUARDIN")

        let carbine = try #require(selection.selections?.selection.first)
        #expect(carbine.name == "Aethershot Carbine")
        let carbineProfile = try #require(carbine.profiles?.profile.first)
        let carbineCharacteristics = try #require(carbineProfile.characteristics.characteristic)
        #expect(carbineCharacteristics.first { $0.name == "Range" }?.value == "12\"")
    }

    @Test func testFortyKSelection() throws {
        let selection = try BattlescribeRoster.Force.Selection.fortyKTest.get()

        #expect(selection.categories?.category.first?.name == "Faction: Imperium")

        let veteran = try #require(selection.selections?.selection.first)
        #expect(veteran.name == "Bladeguard Veteran")
        let veteranSelections = try #require(veteran.selections?.selection)
        let stormShield = try #require(veteranSelections.first)
        #expect(stormShield.name == "Storm Shield")
        let stormShieldAbility = try #require(stormShield.profiles?.profile.first?.characteristics.characteristic.first)
        #expect(stormShieldAbility.value.contains("4+ invulnerable"))
    }
}
