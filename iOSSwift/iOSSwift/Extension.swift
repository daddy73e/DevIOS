//
//  Extension.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/08/10.
//  Copyright © 2020 daddy73. All rights reserved.
//
/* Extension 모음 */

import UIKit

extension String {
    /* Hello -> 안녕 */
    var localized: String {
        return NSLocalizedString(self, tableName:nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /* 1 -> 01 */
    func oneCharValue() -> String {
        let value = self.replacingOccurrences(of: " ", with: "")
        if value.count <= 1 {
            return "0\(value)"
        } else {
            return value
        }
    }
}

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
}

extension UIView {
    func cornerRoud() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    
    func cornerRound(radius:CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}

extension UIColor {
    
    func crossingsLightBlue() -> UIColor {
        return UIColor.init(hexString: "#A4BBC8")
    }
    
    func crossingsBlue() -> UIColor {
        return UIColor.init(hexString: "#5192C6")
    }
    
    func crossingsDarkBlue() -> UIColor {
        return UIColor.init(hexString: "#2681A3")
    }
    
    func crossingsBrown() -> UIColor {
        return UIColor.init(hexString: "#544542")
    }
    
    func crossingsPurple() -> UIColor {
        return UIColor.init(hexString: "#735567")
    }
    
    func crossingsDarkPurple() -> UIColor {
        return UIColor.init(hexString: "#4C4955")
    }
    
    func crossingsPink() -> UIColor {
        return UIColor.init(hexString: "#E0808F")
    }
    
    func crossingsLightOrange() -> UIColor {
        return UIColor.init(hexString: "#FFD2C1")
    }
    
    func crossingsDarkNavy() -> UIColor {
        return UIColor.init(hexString: "#263040")
    }
    
    func crossingsDarkRed() -> UIColor {
        return UIColor.init(hexString: "#A4403D")
    }
    
    func crossingsLightRed() -> UIColor {
        return UIColor.init(hexString: "#CA7C7C")
    }
    
    func crossingsLightPink() -> UIColor {
        return UIColor.init(hexString: "#E9C9CA")
    }
    
    func crossingsWhite() -> UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    func crossingsGray() -> UIColor {
        return UIColor.init(hexString: "#DBDEE3")
    }
    
    func crossingsGreen() -> UIColor {
        return UIColor.init(hexString: "#556F59")
    }
    
    func crossingsLightGreen() -> UIColor {
        return UIColor.init(hexString: "#CED19A")
    }
    
    func crossingsDarkGreen() -> UIColor {
        return UIColor.init(hexString: "#3C4345")
    }
    
    func crossingsText() -> UIColor {
        return UIColor.init(hexString: "#28343D")
    }
    
    func plusBgColor() -> UIColor {
        return UIColor.init(hexString: "#B5D244")
    }
    
    func minusBgColor() -> UIColor {
        return UIColor.init(hexString: "#EE4649")
    }
    
    func plusBgLightColor() -> UIColor {
        return UIColor.init(hexString: "#E4F7BA")
    }
    
    func minusBgLightColor() -> UIColor {
        return UIColor.init(hexString: "#FFD8D8")
    }
    
    func selectBgColor() -> UIColor {
        return UIColor.init(hexString: "#2BCD65")
    }
    
    func naviBgColor() -> UIColor {
        return UIColor.init(hexString: "#D5A641")
    }
    
    func naviBgColorDark() -> UIColor {
        return UIColor.init(hexString: "#4F3006")
    }
    
    func naviBgColorLight() -> UIColor {
        return UIColor.init(hexString: "#F8DA41")
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
