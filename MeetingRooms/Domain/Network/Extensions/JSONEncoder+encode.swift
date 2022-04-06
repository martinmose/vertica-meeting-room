// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

extension JSONEncoder {
    func encode<T>(_ value: T, with strategy: KeyEncodingStrategy?, with formatting: OutputFormatting?) throws -> Data where T: Encodable {
        keyEncodingStrategy = strategy ?? .useDefaultKeys
        outputFormatting = formatting ?? []
        return try encode(value)
    }
}
