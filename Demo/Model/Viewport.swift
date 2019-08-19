// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let viewport = try Viewport(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.viewportTask(with: url) { viewport, response, error in
//     if let viewport = viewport {
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

// MARK: - Viewport
@objcMembers class Viewport: NSObject, Codable {
    let northeast, southwest: Location?

    init(northeast: Location?, southwest: Location?) {
        self.northeast = northeast
        self.southwest = southwest
    }
}

// MARK: Viewport convenience initializers and mutators

extension Viewport {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Viewport.self, from: data)
        self.init(northeast: me.northeast, southwest: me.southwest)
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
        northeast: Location?? = nil,
        southwest: Location?? = nil
    ) -> Viewport {
        return Viewport(
            northeast: northeast ?? self.northeast,
            southwest: southwest ?? self.southwest
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
