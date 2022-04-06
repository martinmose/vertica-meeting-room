// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

enum MeetingRoomService {
    static func get() async throws -> [Floor] {
        let networking = NetworkingMock(json: FloorDTO.mockJSON)
        return try await NetworkManager(networking: networking).request(
            [FloorDTO].self,
            url: Constants.Api.floorUrl,
            method: .get
        )
        .compactMap {
            Floor(from: $0)
        }
    }
}
