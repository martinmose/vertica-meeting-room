// Copyright © 2022 Vertica A/S. All rights reserved.

enum FloorLevel: Int {
    case lower = -1,
         ground = 0,
         first = 1,
         second = 2,

         unknown = 100

    var description: String {
        switch self {
        case .lower:
            return "Underetage"
        case .ground:
            return "Stue"
        case .first:
            return "1. sal"
        case .second:
            return "2. sal"
        case .unknown:
            return "Ukendt"
        }
    }
}

extension FloorLevel: Identifiable {
    var id: Int { rawValue }
}
