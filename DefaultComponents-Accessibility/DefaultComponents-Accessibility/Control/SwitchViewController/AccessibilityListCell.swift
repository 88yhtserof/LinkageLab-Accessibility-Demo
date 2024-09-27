//
//  AccessibilityListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/27/24.
//

import UIKit

class AccessibilityListCell: UICollectionViewListCell {
    
    var actionForAccessibility: (() -> Void)?
    
    override func accessibilityActivate() -> Bool {
        guard let action = actionForAccessibility else { return false }
        action()
        return true
    }
    
}
