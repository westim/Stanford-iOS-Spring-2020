//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Timothy West on 8/15/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    /**
     Searches the unordered array for the given identifiable
     element & returns the index of the first match.
     
     This method does _not_ perform a binary search, which
     would require an ordered array. Complexity of this
     function is O(_n_), where _n_ is the size of the array.
     
     - Parameter matching: The element to match.
     
     - Returns: The index of the first match.
     */
    func firstIndex(matching: Element) -> Int? {
        self.firstIndex { $0.id == matching.id }
    }
}
