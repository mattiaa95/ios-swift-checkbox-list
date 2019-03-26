//
//  ListEnum.swift
//  FlagList
//
//  Created by Mattia on 22/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

enum CountyType : RawRepresentable {
    
    struct County : Equatable {
        let name: String
        let drawableRes: Int
     
        static var ANT: County {
            return County(name: "Antigua y Barbuda", drawableRes: 1)
        }
        
        static var ARG: County {
            return County(name: "Argentina", drawableRes: 2)
        }
        
        static var ARU: County {
            return County(name: "Aruba", drawableRes: 3)
        }
    }
    
    typealias RawValue = County
    
    case ANT
    case ARG
    case ARU
    
    var rawValue: RawValue {
        switch self {
        case .ANT:
            return County.ANT
        case .ARG:
            return County.ARG
        case .ARU:
            return County.ARU
        }
    }
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case County.ANT:
            self = .ANT
        case County.ARG:
            self = .ARG
        case County.ARU:
            self = .ARU
        default: return nil
        }
    }
}
