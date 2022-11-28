//
//  Constants.swift
//  m14full
//
//  Created by Александра Угольнова on 27.11.2022.
//

import UIKit

enum Constants {
    enum Colors {
        static var greenPrimary: UIColor? {
            UIColor(named: "GreenPrimary")
        }
        static var greenSecondary: UIColor? {
            UIColor(named: "GreenSecondary")
        }
    }
    
    enum Fonts {
        static var ui305Semi: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 30)
        }
        static var systemHeading: UIFont {
            UIFont.systemFont(ofSize: 30, weight: .semibold)
        }
        static var systemText: UIFont {
            UIFont.systemFont(ofSize: 16)
        }

    }
    
    enum Image {
        static let austria = UIImage(named: "Austria")
        static let belgium = UIImage(named: "Belgium")
        static let france = UIImage(named: "France")
        static let germany = UIImage(named: "Germany")
        static let greece = UIImage(named: "Greece")
    }
    
    
}

