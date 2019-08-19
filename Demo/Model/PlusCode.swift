// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let plusCode = try PlusCode(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.plusCodeTask(with: url) { plusCode, response, error in
//     if let plusCode = plusCode {
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

// MARK: - PlusCode
@objcMembers class PlusCode: NSObject, Codable {
    let compoundCode, globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }

    init(compoundCode: String?, globalCode: String?) {
        self.compoundCode = compoundCode
        self.globalCode = globalCode
    }
}

// MARK: PlusCode convenience initializers and mutators

extension PlusCode {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(PlusCode.self, from: data)
        self.init(compoundCode: me.compoundCode, globalCode: me.globalCode)
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
        compoundCode: String?? = nil,
        globalCode: String?? = nil
    ) -> PlusCode {
        return PlusCode(
            compoundCode: compoundCode ?? self.compoundCode,
            globalCode: globalCode ?? self.globalCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
