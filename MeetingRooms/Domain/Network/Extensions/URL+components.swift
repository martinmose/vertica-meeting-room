// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

extension URL {
    func components(resolvingAgainstBaseURL: Bool = true) -> URLComponents {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL) else {
            fatalError("url: \(absoluteString) is not valid")
        }

        return components
    }
}
