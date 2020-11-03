//
//  APIService.swift
//  iOSSwift
//
//  Created by Yeongeun Song on 2020/11/03.
//  Copyright © 2020 daddy73. All rights reserved.
//

import Foundation
import RxSwift

class ApiService {
    
    private init() {}
    static let shared = ApiService()
    private static let baseUrl = "https://itunes.apple.com"
    
    static func fetchAllSearchItemRx(text:String) -> Observable<Data> {
        return Observable.create { emitter in
            requestSearchItem(term: text, onComplete: { result in
                switch result {
                case let .success(dada):
                    emitter.onNext(dada)
                    emitter.onCompleted()
                case let .failure(err):
                    emitter.onError(err)
                }
            })
            return Disposables.create()
            
        }
        
    }
    
    static func requestSearchItem(term: String,
                                  onComplete: @escaping (Result<Data, Error>) -> Void) {
        var components = URLComponents(string: "\(baseUrl)/search")!
        components.queryItems = [
            URLQueryItem(name: "term", value: "\(term)"),
            URLQueryItem(name: "country", value: "kr"),
            URLQueryItem(name: "media", value: "software"),
        ]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let err = error {
                onComplete(.failure(err))
                return
            }
            
            guard let data = data else {
                let httpResponse = response as! HTTPURLResponse
                onComplete(.failure(NSError(domain: "no data",
                                            code: httpResponse.statusCode,
                                            userInfo: nil)))
                return
            }
            
            onComplete(.success(data))
        }).resume()
    }
    
    private func parseData(json: Any) -> [SearchItem] {
        guard let items = json as? [String: Any]  else {
            return []
        }
        
        let results:[[String: Any]] = items["results"] as! [[String : Any]]
        var repositories = [SearchItem]()
        results.forEach { (value) in
            let searchItem = SearchItem(value: value)
            repositories.append(searchItem)
        }
        return repositories
    }
}
