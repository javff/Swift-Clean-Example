//
//  ExampleEffects.swift
//  Clean-Arquitecture
//
//  Created by Juan Andres Vasquez on 24/4/23.
//

import Foundation

enum ExampleEffects {
    case loadNewInfo
    case reloadInfo(_ id: String)
    case openOption(_ kind: DeliveryOptionKindModel)
}
