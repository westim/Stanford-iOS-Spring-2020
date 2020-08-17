//
//  Array+Only.swift
//  Memorize
//
//  Created by Timothy West on 8/16/20.
//  Copyright © 2020 Tim West. All rights reserved.
//

import Foundation

extension Array {
    /// Returns the element if only one exists, otherwise returns `nil`.
    var only: Element? {
        count == 1 ? first : nil
    }
}
