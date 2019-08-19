// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let root = try Root(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.rootTask(with: url) { root, response, error in
//     if let root = root {
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

// MARK: - Root
@objcMembers class Root: NSObject, Codable {
    let htmlAttributions: [JSONAny]?
    let nextPageToken: String?
    let results: [Result]?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results, status
    }

    init(htmlAttributions: [JSONAny]?, nextPageToken: String?, results: [Result]?, status: String?) {
        self.htmlAttributions = htmlAttributions
        self.nextPageToken = nextPageToken
        self.results = results
        self.status = status
    }
}

// MARK: Root convenience initializers and mutators

extension Root {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Root.self, from: data)
        self.init(htmlAttributions: me.htmlAttributions, nextPageToken: me.nextPageToken, results: me.results, status: me.status)
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
        htmlAttributions: [JSONAny]?? = nil,
        nextPageToken: String?? = nil,
        results: [Result]?? = nil,
        status: String?? = nil
    ) -> Root {
        return Root(
            htmlAttributions: htmlAttributions ?? self.htmlAttributions,
            nextPageToken: nextPageToken ?? self.nextPageToken,
            results: results ?? self.results,
            status: status ?? self.status
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
