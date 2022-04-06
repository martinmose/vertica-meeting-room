// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

struct Headers {
    enum Key: String {
        case authorization = "Authorization"
    }

    private var dictionary: [Key: String]

    var isEmpty: Bool { dictionary.isEmpty }

    init(_ dictionary: [Key: String] = [:]) {
        self.dictionary = dictionary
    }

    subscript(key: Key) -> String? {
        get { dictionary[key] }
        set { dictionary[key] = newValue }
    }

    func forEach(_ body: (String, String) -> Void) {
        dictionary.forEach { body($0.rawValue, $1) }
    }
}
