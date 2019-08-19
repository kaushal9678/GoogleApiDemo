// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let geometry = try Geometry(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.geometryTask(with: url) { geometry, response, error in
//     if let geometry = geometry {
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

// MARK: - Geometry
@objcMembers class Geometry: NSObject, Codable {
    let location: Location?
    let viewport: Viewport?

    init(location: Location?, viewport: Viewport?) {
        self.location = location
        self.viewport = viewport
    }
}

// MARK: Geometry convenience initializers and mutators

extension Geometry {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Geometry.self, from: data)
        self.init(location: me.location, viewport: me.viewport)
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
        location: Location?? = nil,
        viewport: Viewport?? = nil
    ) -> Geometry {
        return Geometry(
            location: location ?? self.location,
            viewport: viewport ?? self.viewport
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
