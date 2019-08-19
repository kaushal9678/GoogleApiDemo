// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let openingHours = try OpeningHours(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.openingHoursTask(with: url) { openingHours, response, error in
//     if let openingHours = openingHours {
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

// MARK: - OpeningHours
@objcMembers class OpeningHours: NSObject, Codable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }

    init(openNow: Bool?) {
        self.openNow = openNow
    }
}

// MARK: OpeningHours convenience initializers and mutators

extension OpeningHours {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(OpeningHours.self, from: data)
        self.init(openNow: me.openNow)
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
        openNow: Bool?? = nil
    ) -> OpeningHours {
        return OpeningHours(
            openNow: openNow ?? self.openNow
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
