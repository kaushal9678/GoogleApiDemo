// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try Result(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
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

// MARK: - Result
@objcMembers class Result: NSObject, Codable {
    let geometry: Geometry?
    let icon: String?
    let id, name: String?
    let photos: [Photo]?
    let placeID: String?
    let plusCode: PlusCode?
    let rating: Double?
    let reference: String?
    let scope: Scope?
    let types: [String]?
    let userRatingsTotal: Int?
    let vicinity: String?
    let openingHours: OpeningHours?
    let priceLevel: Int?

    enum CodingKeys: String, CodingKey {
        case geometry, icon, id, name, photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
        case openingHours = "opening_hours"
        case priceLevel = "price_level"
    }

    init(geometry: Geometry?, icon: String?, id: String?, name: String?, photos: [Photo]?, placeID: String?, plusCode: PlusCode?, rating: Double?, reference: String?, scope: Scope?, types: [String]?, userRatingsTotal: Int?, vicinity: String?, openingHours: OpeningHours?, priceLevel: Int?) {
        self.geometry = geometry
        self.icon = icon
        self.id = id
        self.name = name
        self.photos = photos
        self.placeID = placeID
        self.plusCode = plusCode
        self.rating = rating
        self.reference = reference
        self.scope = scope
        self.types = types
        self.userRatingsTotal = userRatingsTotal
        self.vicinity = vicinity
        self.openingHours = openingHours
        self.priceLevel = priceLevel
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Result.self, from: data)
        self.init(geometry: me.geometry, icon: me.icon, id: me.id, name: me.name, photos: me.photos, placeID: me.placeID, plusCode: me.plusCode, rating: me.rating, reference: me.reference, scope: me.scope, types: me.types, userRatingsTotal: me.userRatingsTotal, vicinity: me.vicinity, openingHours: me.openingHours, priceLevel: me.priceLevel)
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
        geometry: Geometry?? = nil,
        icon: String?? = nil,
        id: String?? = nil,
        name: String?? = nil,
        photos: [Photo]?? = nil,
        placeID: String?? = nil,
        plusCode: PlusCode?? = nil,
        rating: Double?? = nil,
        reference: String?? = nil,
        scope: Scope?? = nil,
        types: [String]?? = nil,
        userRatingsTotal: Int?? = nil,
        vicinity: String?? = nil,
        openingHours: OpeningHours?? = nil,
        priceLevel: Int?? = nil
    ) -> Result {
        return Result(
            geometry: geometry ?? self.geometry,
            icon: icon ?? self.icon,
            id: id ?? self.id,
            name: name ?? self.name,
            photos: photos ?? self.photos,
            placeID: placeID ?? self.placeID,
            plusCode: plusCode ?? self.plusCode,
            rating: rating ?? self.rating,
            reference: reference ?? self.reference,
            scope: scope ?? self.scope,
            types: types ?? self.types,
            userRatingsTotal: userRatingsTotal ?? self.userRatingsTotal,
            vicinity: vicinity ?? self.vicinity,
            openingHours: openingHours ?? self.openingHours,
            priceLevel: priceLevel ?? self.priceLevel
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
