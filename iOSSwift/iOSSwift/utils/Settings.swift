//
//  Settings.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/04.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation

class Settings {
    
    static let shared = Settings()
    
    private let KEY_RECENT_SEARCH = "KEY_RECENT_SEARCH"
    
    private init() {}
    
    public var searchText:String {
        get {
            return UserDefaults.standard.string(forKey: KEY_RECENT_SEARCH) ?? ""
        }
        
        set {
            let savedString = UserDefaults.standard.string(forKey: KEY_RECENT_SEARCH) ?? ""
            var strUpdate = ""
            if !savedString.isEmpty {
                let newValueLow = newValue.lowercased()
                let removeSpace = newValueLow.replacingOccurrences(of: " ", with: "")
                if removeSpace.count == 0 {
                    /* 공백이면 저장안함 */
                    return
                }
                
                /* 중복 필터 */
                let strSavedArray = savedString.components(separatedBy: ",")
                var filteredArray = strSavedArray.filter({ (each) -> Bool in
                    let lowercased = each.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    return lowercased != newValueLow
                })
                filteredArray.append(newValue)
                if filteredArray.count > 100 {
                    filteredArray.removeFirst()
                }
                
                strUpdate = filteredArray.joined(separator: ",")
            } else {
                strUpdate = newValue
            }
            
            UserDefaults.standard.setValue(strUpdate, forKey: KEY_RECENT_SEARCH)
            UserDefaults.standard.synchronize()
        }
    }
    
    public func recentSearchTxt() -> [String] {
        let savedString = UserDefaults.standard.string(forKey: KEY_RECENT_SEARCH) ?? ""
        if savedString.isEmpty {
            return []
        }
        
        let strArray = savedString.components(separatedBy: ",")
        return strArray.reversed()
    }
}
