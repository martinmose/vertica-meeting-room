// Copyright © 2022 Vertica A/S. All rights reserved.

extension MeetingRoomService {
    struct MeetingRoomDTO: Decodable {
        let room: String
        let isUseable: Bool
    }
}
