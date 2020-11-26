//
//  Model.swift
//  Covid 19
//
//  Created by Yazid Al Ghazali on 12/11/20.
//  Copyright © 2020 Yazid Al Ghazali. All rights reserved.
//

import Foundation

struct Countries: Decodable {
    let countries: [Country]

    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
}

// MARK: - Country
struct Country: Decodable, Identifiable {
    let id = UUID()
    let country, countryCode : String
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    enum CodingKeys: String, CodingKey {
        case id
        case country = "Country"
        case countryCode = "CountryCode"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    
    }
}

struct WelcomeElement: Codable {
    let attributes: Attributes
    
}

// MARK: - Attributes
struct Attributes: Codable {
    let fid, kodeProvi: Int
    let provinsi: String
    let kasusPosi, kasusSemb, kasusMeni: Int

    enum CodingKeys: String, CodingKey {
        case fid = "FID"
        case kodeProvi = "Kode_Provi"
        case provinsi = "Provinsi"
        case kasusPosi = "Kasus_Posi"
        case kasusSemb = "Kasus_Semb"
        case kasusMeni = "Kasus_Meni"
    }
}

typealias Welcome = [WelcomeElement]
