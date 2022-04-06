// Copyright © 2022 Vertica A/S. All rights reserved.

struct Floor {
    let name: String
    let level: Int
    let meetingRooms: [MeetingRoom]
}

extension Floor: Identifiable {
    var id: String { name }
}

extension Floor {
    init(from dto: MeetingRoomService.FloorDTO) {
        let floorLevel = FloorLevel(rawValue: dto.level) ?? .unknown
        name = floorLevel.description
        level = floorLevel.rawValue
        meetingRooms = dto.meetingRooms.map { MeetingRoom(from: $0, floor: floorLevel) }
    }
}
