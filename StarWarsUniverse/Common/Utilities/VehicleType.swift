//
//  VehicleType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

enum VehicleType: String, Codable {
    case diggerCrawler              = "Digger Crawler"
    case landspeeder                = "X-34 landspeeder"
    case fluttercraft               = "Raddaugh Gnasp fluttercraft"
    case landingCraft               = "C-9979 landing craft"
    case tribubbleBongo             = "Tribubble bongo"
    
    case skyhopper                  = "T-16 skyhopper"
    case starfighter                = "Twin Ion Engine/Ln Starfighter"
    case droidStarfighter           = "Vulture-class droid starfighter"
    
    case airspeeder                 = "t-47 airspeeder"
    case exodriveAirspeeder         = "Koro-2 Exodrive airspeeder"
    case xJAirspeeder               = "XJ-6 airspeeder"
    case flitknotSpeeder            = "Flitknot speeder"
    
    case bomber                     = "TIE/sa bomber"
    case transportShuttle           = "Sheathipede-class transport shuttle"
    case territorialDefense         = "Nantex-class territorial defense"
    case droidGunship               = "HMP droid gunship"
    case triFighter                 = "tri-fighter"
    case catamaran                  = "Oevvaor jet catamaran"
    
    case twinPod                    = "Storm IV Twin-Pod"
    case barge                      = "Modified Luxury Sail Barge"
    case bantha                     = "Bantha-II"
    case engineInterceptor          = "Twin Ion Engine Interceptor"
    case aerialPlatform             = "Single Trooper Aerial Platform"
    case tacticalEnforcer           = "All Terrain Tactical Enforcer"
    
    case tank                       = "Armoured Assault Tank"
    case heavyArtillery             = "Self-Propelled Heavy Artillery"
    case juggernaut                 = "HAVw A6 Juggernaut"
    
    case armoredTransport           = "All Terrain Armored Transport"
    case scoutTransport             = "All Terrain Scout Transport"
    case multiTroopTransport        = "Multi-Troop Transport"
    case assaultInfrantryTransport  = "Low Altitude Assault Transport/infrantry"
    case scoutCarrierTransport      = "Low Altitude Assault Transport/carrier"
    case reconTransport             = "All Terrain Recon Transport"
    
    case speederBike                = "74-Z speeder bike"
    case speederBikeTwo             = "FC-20 speeder bike"
    case swoopBike                  = "Zephyr-G swoop bike"
    
    case unknown
    
    var imageType: ImageNameType {
        switch self {
        case .diggerCrawler,
                .landspeeder,
                .landingCraft,
                .tribubbleBongo,
                .fluttercraft:
            return .diggerCrawler
        case .skyhopper,
                .starfighter,
                .droidStarfighter:
            return .skyhopper
        case .airspeeder,
                .flitknotSpeeder,
                .xJAirspeeder,
                .exodriveAirspeeder:
            return .airspeeder
        case .aerialPlatform,
                .barge,
                .bantha,
                .engineInterceptor,
                .tacticalEnforcer:
            return .aerialPlatform
        case .twinPod:
            return .twinPod
        case .juggernaut,
                .heavyArtillery,
                .tank:
            return .juggernaut
        case .armoredTransport,
                .scoutTransport,
                .multiTroopTransport,
                .assaultInfrantryTransport,
                .scoutCarrierTransport,
                .reconTransport:
            return .armoredTransport
        case .speederBike,
                .speederBikeTwo,
                .swoopBike:
            return .speederBike
        default:
            return .unknown
        }
    }
}
