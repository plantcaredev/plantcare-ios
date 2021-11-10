//
//  ArrayExtensions.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-09.
//

import Foundation

extension Array where Element: Hashable {
    func uniqued() -> Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
