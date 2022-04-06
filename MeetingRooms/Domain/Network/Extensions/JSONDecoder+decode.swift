// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

extension JSONDecoder {
    func decode<T>(_ type: T.Type,
                   from data: Data,
                   with keyStrategy: KeyDecodingStrategy? = nil,
                   _ dateStrategy: DateDecodingStrategy? = nil) throws -> T where T: Decodable
    {
        keyDecodingStrategy = keyStrategy ?? .useDefaultKeys
        dateDecodingStrategy = dateStrategy ?? .deferredToDate
        return try decode(type, from: data)
    }
}
