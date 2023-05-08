//
//  File.swift
//  
//
//  Created by Juan vasquez on 08-03-22.
//

import Foundation

public protocol SectionTypeFactoryProtocol: AnyObject {
    func create(section: BaseSectionIdentifier) -> BaseSectionControllerProtocol?
}
