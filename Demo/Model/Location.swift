// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let location = try Location(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.locationTask(with: url) { location, response, error in
//     if let location = location {
//       ...
//     }
//   }
//   task.resume()
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Location
@objcMembers class Location: NSObject, Codable {
    let lat, lng: Double?

    init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: Location convenience initializers and mutators

extension Location {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Location.self, from: data)
        self.init(lat: me.lat, lng: me.lng)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lat: Double?? = nil,
        lng: Double?? = nil
    ) -> Location {
        return Location(
            lat: lat ?? self.lat,
            lng: lng ?? self.lng
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
