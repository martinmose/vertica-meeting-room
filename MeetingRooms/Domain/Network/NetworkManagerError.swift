// Copyright © 2022 Vertica A/S. All rights reserved.

extension NetworkManager {
    enum NetworkManagerError: Error {
        case error(errorMessage: String?),
             serverError(statusCode: Int)
    }
}
