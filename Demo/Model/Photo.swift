// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try Photo(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.photoTask(with: url) { photo, response, error in
//     if let photo = photo {
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

// MARK: - Photo
@objcMembers class Photo: NSObject, Codable {
    let height: Int?
    let htmlAttributions: [String]?
    let photoReference: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }

    init(height: Int?, htmlAttributions: [String]?, photoReference: String?, width: Int?) {
        self.height = height
        self.htmlAttributions = htmlAttributions
        self.photoReference = photoReference
        self.width = width
    }
}

// MARK: Photo convenience initializers and mutators

extension Photo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Photo.self, from: data)
        self.init(height: me.height, htmlAttributions: me.htmlAttributions, photoReference: me.photoReference, width: me.width)
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
        height: Int?? = nil,
        htmlAttributions: [String]?? = nil,
        photoReference: String?? = nil,
        width: Int?? = nil
    ) -> Photo {
        return Photo(
            height: height ?? self.height,
            htmlAttributions: htmlAttributions ?? self.htmlAttributions,
            photoReference: photoReference ?? self.photoReference,
            width: width ?? self.width
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
