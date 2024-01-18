//
//  UserDetailsResponse.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation


// MARK: - UsersDetailsResponse
struct UsersDetailsResponse: Codable {
    let address: Address
    let id: Int
    let email, username, password: String
    let name: Name
    let phone: String

}

// MARK: - Address
struct Address: Codable {
    let geolocation: Geolocation
    let city, street: String
    let number: Int
    let zipcode: String
}

// MARK: - Geolocation
struct Geolocation: Codable {
    let lat, long: String
}

// MARK: - Name
struct Name: Codable {
    let firstname, lastname: String
}

typealias UsersResponse = [UsersDetailsResponse]

extension UsersDetailsResponse {
    static var sampleUserDetails: UsersDetailsResponse{
        .init(address: Address(geolocation: Geolocation(lat: "37.3159", long: "81.1496"), city: "kilcoole", street: "new road", number: 7682, zipcode: "12926-3874"), id: 1, email: "john@gmail.com", username: "johnd", password: "m38rmF$", name: Name(firstname: "john", lastname: "doe"), phone: "1-570-236-7033")
    }
}
