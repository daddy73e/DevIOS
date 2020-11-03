//
//  SearchItemStore.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchFetchable {
    func fetchMenus(text:String) -> Observable<[SearchItem]>
}

class SearchItemStore: SearchFetchable {
    func fetchMenus(text:String) -> Observable<[SearchItem]> {
        struct Response: Decodable {
            let items: [SearchItem]
        }
        
        return ApiService.fetchAllSearchItemRx(text: text)
            .map { data in guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                throw NSError(domain: "Decoding error", code: -1, userInfo: nil)
            }
            return response.items
        }
    }
}
