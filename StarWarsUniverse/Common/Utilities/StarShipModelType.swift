//
//  StarShipModelType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 02.01.2023.
//

import Foundation

enum StarShipModelType: String, Codable {
    case yWing              = "BTL Y-wing"
    case xWing              = "T-65 X-wing"
    case aWing              = "RZ-1 A-wing Interceptor"
    case bWing              = "A/SF-01 B-wing starfighter"
    case jWing              = "J-type star skiff"
    case vWing              = "Alpha-3 Nimbus-class V-wing starfighter"
    case corvette           = "CR90 corvette"
    case destroyer          = "Imperial I-class Star Destroyer"
    case carrierDestroyer   = "Providence-class carrier/destroyer"
    case starDestroyer      = "Senator-class Star Destroyer"
    case landingCraft       = "Sentinel-class landing craft"
    case orbitalBattleStation = "DS-1 Orbital Battle Station"
    case lightFreighter     = "YT-1300 light freighter"
    case freighterLiner     = "Botajef AA-9 Freighter-Liner"
    case xOne               = "Twin Ion Engine Advanced x1"
    case dreadnought        = "Executor-class star dreadnought"
    case mediumTransport    = "GR-75 medium transport"
    case patrolAndAttack    = "Firespray-31-class patrol and attack"
    case shuttleLambda      = "Lambda-class T-4a shuttle"
    case shuttleTheta       = "Theta-class T-2c shuttle"
    case escortFrigate      = "EF76 Nebulon-B escort frigate"
    case starFrigate        = "Munificent-class star frigate"
    case starCruiser        = "MC80 Liberty type Star Cruiser"
    case consularClassCruiser = "Consular-class cruiser"
    case droidControlShip   = "Lucrehulk-class Droid Control Ship"
    case assaultShip        = "Acclamator I-class assault ship"
    case royalStarship      = "J-type 327 Nubian royal starship"
    case starfighterN       = "N-1 starfighter"
    case starfighte         = "Aggressive Reconnaissance-170 starfighte"
    case starfighterBelbullab = "Belbullab-22 starfighter"
    case starCourier        = "Star Courier"
    case diplomaticBarge    = "J-type diplomatic barge"
    case interceptor        = "Delta-7 Aethersprite-class interceptor"
    case lightInterceptor   = "Eta-2 Actis-class light interceptor"
    case yacht              = "H-type Nubian yacht"
    case interstellarSloop  = "Punworcca 116-class interstellar sloop"
    
    var imageType: ImageNameType {
        switch self {
        case .yWing,
                .xWing,
                .aWing,
                .bWing,
                .jWing,
                .vWing,
                .starfighterN,
                .starfighte:
            return .starfighteShip
        case .destroyer,
                .carrierDestroyer,
                .starDestroyer:
            return .destroyerShip
        case .orbitalBattleStation:
            return .battleStantionShip
        case .freighterLiner,
                .starfighterBelbullab,
                .lightFreighter:
            return .frigateShip
        case .mediumTransport,
                .dreadnought,
                .xOne,
                .patrolAndAttack:
            return .transporterShip
        case .escortFrigate,
                .starFrigate:
            return .frigateShip
        case .starCruiser,
                .consularClassCruiser:
            return .cruiserShip
        case .interceptor,
                .lightInterceptor:
            return .interseptorShip
        case .corvette,
                .interstellarSloop,
                .yacht,
                .starCourier,
                .diplomaticBarge,
                .assaultShip,
                .royalStarship,
                .droidControlShip,
                .shuttleLambda,
                .shuttleTheta,
                .landingCraft:
            return .corvetteShip
        }
    }
}
