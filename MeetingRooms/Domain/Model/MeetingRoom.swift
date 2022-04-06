// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

struct MeetingRoom {
    let name: MeetingRoomName
    let floor: FloorLevel
    let isUseable: Bool

    init(name: MeetingRoomName, floor: FloorLevel, isUseable: Bool? = nil) {
        self.name = name
        self.floor = floor
        self.isUseable = isUseable ?? true
    }
}

extension MeetingRoom: Identifiable {
    var id: String { name.rawValue }
}

extension MeetingRoom {
    init(from dto: MeetingRoomService.MeetingRoomDTO, floor: FloorLevel) {
        name = MeetingRoomName(rawValue: dto.room.lowercased()) ?? .unknown
        self.floor = floor
        isUseable = dto.isUseable
    }
}

extension MeetingRoom {
    static let mock = MeetingRoom(name: .lemmings, floor: .ground, isUseable: true)
}
