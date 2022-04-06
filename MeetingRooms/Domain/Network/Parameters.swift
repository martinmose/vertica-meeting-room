// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

protocol Parameters: Encodable {
    var urlQueryItems: [URLQueryItem] { get }
    func httpBody(with strategy: JSONEncoder.KeyEncodingStrategy?,
                  with formatting: JSONEncoder.OutputFormatting?,
                  with dateEncoding: JSONEncoder.DateEncodingStrategy?) -> Data?
}

extension Parameters {
    var dateFormatter: DateFormatter? { nil }

    var urlQueryItems: [URLQueryItem] {
        dictionary
            .flatMap { key, value -> [URLQueryItem] in
                switch value {
                case let value as NSArray:
                    // Flatten array into multiple values with same key
                    return value.map {
                        URLQueryItem(name: key,
                                     value: "\($0)")
                    }
                // Due to our dictionary extension where we use JSONSerialization to solve the problem about the query parameters in the format:
                // parameter1=x&parameter1=y&paramater1=z (as NSArray).
                // JSONSerialization is written in Objective-C
                // so storing these values is not the Swift types - Ints, Doubles or Bools, but instead as NSNumber.
                // We need to ensure when we have specified Bool in our RequestParameters we sent it as true/false
                case let value as NSNumber where CFGetTypeID(value as CFTypeRef) == CFBooleanGetTypeID():
                    return [URLQueryItem(name: key,
                                         value: value == 1 ? String(true) : String(false))]
                default:
                    return [URLQueryItem(name: key,
                                         value: "\(value)")]
                }
            }
    }

    func httpBody(with strategy: JSONEncoder.KeyEncodingStrategy? = nil,
                  with formatting: JSONEncoder.OutputFormatting? = nil,
                  with dateEncoding: JSONEncoder.DateEncodingStrategy? = nil) -> Data?
    {
        let encoder = JSONEncoder()
        if let dateEncoding = dateEncoding {
            encoder.dateEncodingStrategy = dateEncoding
        }
        return try? encoder.encode(self, with: strategy, with: formatting)
    }

    private var dictionary: [String: Any] {
        (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
