//
//  FlagResponse.swift
//  sesi2-negara
//
//  Created by Dony Prastiya on 04/03/23.
//

import Foundation

struct FlagResponse : Decodable{
    let common : String
    let capital: [String]
    let region : String
    let subregion : String
    let population : Int
    let flagsPng : String
    let coatOfArmsPng : String
    let languages : [String : String]
     
    enum CodingKeys: String, CodingKey{
        case name
        case capital
        case region
        case subregion
        case population
        case flags
        case coatOfArms
        case languages
    }
    
    enum NameKeys: String, CodingKey{
        case common
    }
    
    enum FlagsKeys: String, CodingKey{
        case png
    }
    
    enum CoatOfKeys: String, CodingKey{
        case png
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        let flagsContainer = try container.nestedContainer(keyedBy: FlagsKeys.self, forKey: .flags)
        let coatOfArmsContainer = try container.nestedContainer(keyedBy: CoatOfKeys.self, forKey: .coatOfArms)
        
        common = try nameContainer.decodeIfPresent(String.self, forKey: .common) ?? ""
        capital = try container.decodeIfPresent([String].self, forKey: .capital) ?? []
        region = try container.decodeIfPresent(String.self, forKey: .region) ?? ""
        subregion = try container.decodeIfPresent(String.self, forKey: .subregion) ?? ""
        population = try container.decodeIfPresent(Int.self, forKey: .population) ?? 0
        flagsPng = try flagsContainer.decodeIfPresent(String.self, forKey: .png) ?? ""
        coatOfArmsPng = try coatOfArmsContainer.decodeIfPresent(String.self, forKey: .png) ?? ""
        languages = try container.decodeIfPresent([String : String].self, forKey: .languages) ?? [:]

    }

}

