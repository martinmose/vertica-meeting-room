// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

protocol DecodableWithDefaultUnknown: RawRepresentable, Decodable where RawValue: Decodable {
    static var unknown: Self { get }
}

extension DecodableWithDefaultUnknown {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(Self.RawValue.self)

        self = Self(rawValue: rawValue) ?? .unknown
    }
}
