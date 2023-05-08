//
//  File.swift
//  
//
//  Created by Juan vasquez on 14-03-22.
//

import Foundation

extension ListAdapter {
    func executeFirstLoad(_ sections: [BaseSectionData]) {
        guard let listView = listView else { return }
        self.currentSections = sections
        self.loadedSections = []
        listView.containerView.cleanSubViews()

        sections.forEach {
            insertSectionInContainer($0)
            loadedSections.append($0)
        }
    }
}
