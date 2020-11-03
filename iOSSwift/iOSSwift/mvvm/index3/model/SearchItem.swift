//
//  SearchItems.swift
//  kakaobank
//
//  Created by Yeongeun Song on 2020/09/17.
//  Copyright © 2020 daddy73. All rights reserved.
//

import UIKit

struct SearchItem:Codable {
    
    let isGameCenterEnabled:Bool
    let isVppDeviceBasedLicensingEnabled:Bool
    let userRatingCountForCurrentVersion:Int
    let trackId:Int
    let artistId:Int
    let userRatingCount:Int
    let primaryGenreId:Int
    let price:Float
    let averageUserRating:Double
    let averageUserRatingForCurrentVersion:Double
    let kind:String
    let releaseDate:String
    let formattedPrice:String
    let releaseNotes:String
    let minimumOsVersion:String
    let primaryGenreName:String
    let currentVersionReleaseDate:String
    let sellerName:String
    let trackCensoredName:String
    let trackViewUrl:String
    let contentAdvisoryRating:String
    let fileSizeBytes:String
    let sellerUrl:String
    let trackContentRating:String
    let trackName:String
    let description:String
    let artistName:String
    let currency:String
    let bundleId:String
    let version:String
    let wrapperType:String
    let artistViewUrl:String
    let artworkUrl60:String
    let artworkUrl100:String
    let artworkUrl512:String
    let features:[String]
    let advisories:[String]
    let supportedDevices:[String]
    let appletvScreenshotUrls:[String]
    let screenshotUrls:[String]
    let ipadScreenshotUrls:[String]
    let genres:[String]
    let genreIds:[String]
    let languageCodesISO2A:[String]
    
    init(value:[String:Any]) {
        isGameCenterEnabled = (value["isGameCenterEnabled"] as? Bool ?? false)
        isVppDeviceBasedLicensingEnabled = (value["isVppDeviceBasedLicensingEnabled"] as? Bool ?? false)
        userRatingCountForCurrentVersion = (value["userRatingCountForCurrentVersion"] as? Int ?? 0)
        trackId = (value["trackId"] as? Int ?? 0)
        artistId = (value["artistId"] as? Int ?? 0)
        userRatingCount = (value["userRatingCount"] as? Int ?? 0)
        primaryGenreId = (value["primaryGenreId"] as? Int ?? 0)
        price = (value["price"] as? Float ?? 0.0)
        averageUserRating = (value["averageUserRating"] as? Double ?? 0.0)
        averageUserRatingForCurrentVersion = (value["averageUserRatingForCurrentVersion"] as? Double ?? 0.0)
        kind = (value["kind"] as? String ?? "")
        releaseDate = (value["releaseDate"] as? String ?? "")
        formattedPrice = (value["formattedPrice"] as? String ?? "")
        releaseNotes = (value["releaseNotes"] as? String ?? "")
        minimumOsVersion = (value["minimumOsVersion"] as? String ?? "")
        primaryGenreName = (value["primaryGenreName"] as? String ?? "")
        currentVersionReleaseDate = (value["currentVersionReleaseDate"] as? String ?? "")
        sellerName = (value["sellerName"] as? String ?? "")
        trackCensoredName = (value["trackCensoredName"] as? String ?? "")
        trackViewUrl = (value["trackViewUrl"] as? String ?? "")
        contentAdvisoryRating = (value["contentAdvisoryRating"] as? String ?? "")
        fileSizeBytes = (value["fileSizeBytes"] as? String ?? "")
        sellerUrl = (value["sellerUrl"] as? String ?? "")
        trackContentRating = (value["trackContentRating"] as? String ?? "")
        trackName = (value["trackName"] as? String ?? "")
        description = (value["description"] as? String ?? "")
        artistName = (value["artistName"] as? String ?? "")
        currency = (value["currency"] as? String ?? "")
        bundleId = (value["bundleId"] as? String ?? "")
        version = (value["version"] as? String ?? "")
        wrapperType = (value["wrapperType"] as? String ?? "")
        artistViewUrl = (value["artistViewUrl"] as? String ?? "")
        artworkUrl60 = (value["artworkUrl60"] as? String ?? "")
        artworkUrl100 = (value["artworkUrl100"] as? String ?? "")
        artworkUrl512 = (value["artworkUrl512"] as? String ?? "")
        features = (value["features"] as? [String] ?? [String]())
        advisories = (value["advisories"] as? [String] ?? [String]())
        supportedDevices = (value["supportedDevices"] as? [String] ?? [String]())
        appletvScreenshotUrls = (value["appletvScreenshotUrls"] as? [String] ?? [String]())
        screenshotUrls = (value["screenshotUrls"] as? [String] ?? [String]())
        ipadScreenshotUrls = (value["ipadScreenshotUrls"] as? [String] ?? [String]())
        genres = (value["genres"] as? [String] ?? [String]())
        genreIds = (value["genreIds"] as? [String] ?? [String]())
        languageCodesISO2A = (value["languageCodesISO2A"] as? [String] ?? [String]())
    }
}
