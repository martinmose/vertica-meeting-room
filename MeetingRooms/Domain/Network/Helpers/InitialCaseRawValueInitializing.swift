// Copyright © 2022 Vertica A/S. All rights reserved.

protocol InitialCaseRawValueInitializing: RawRepresentable, CaseIterable {}

extension InitialCaseRawValueInitializing where RawValue: StringProtocol {
    init?(rawValue: String) {
        let value = rawValue.prefix(1).lowercased() + rawValue.dropFirst()

        let key = Self
            .allCases
            .filter { $0.rawValue == value }
            .first

        guard let key = key else {
            return nil
        }

        self = key
    }
}
