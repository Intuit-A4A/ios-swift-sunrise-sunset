//
//  Networking.swift
//

import Foundation
import MapKit

struct SunriseSunset: Decodable, Hashable {
    let sunrise: String?
    let sunset: String?
    let first_light: String?
    let last_light: String?
    let dawn: String?
    let dusk: String?
    let solar_noon: String?
    let golden_hour: String?
    let day_length: String?
    let timezone: String?
}

struct SunriseSunsetResponse: Decodable, Hashable {
    let results: SunriseSunset
    let status: String
}

struct Networking {
    var session = URLSession.shared
    var geocoder = CLGeocoder()
    
    init() { }
    
    // Grab sunrise and sunset data from a lat / long
    func grabSunriseSunset(lat: Double, long: Double) async throws -> SunriseSunsetResponse {
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: URL(string: "https://api.sunrisesunset.io/json?lat=\(lat)&lng=\(long)&date=today")!))
        return try JSONDecoder().decode(SunriseSunsetResponse.self, from: data)
    }
    
    // Get geocode placemark i.e. "San Diego, CA" from a MKCoordinateRegion
    func getPlacemarks(region: MKCoordinateRegion, completionHandler: @escaping (Result<String, Error>) -> Void) {
        geocoder.reverseGeocodeLocation(CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)) { (placemarks, error) in
            completionHandler(.success("\(placemarks?.first?.thoroughfare ?? "") \(placemarks?.first?.locality ?? "") \(placemarks?.first?.administrativeArea ?? "")"))
        }
    }
}
