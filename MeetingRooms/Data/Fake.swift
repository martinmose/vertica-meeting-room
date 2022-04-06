// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

enum Fake {
    static let meetingRooms = [
        MeetingRoom(name: .lemmings, floor: .lower),

        MeetingRoom(name: .tekken, floor: .ground),
        MeetingRoom(name: .spaceInvaders, floor: .ground),
        MeetingRoom(name: .zelda, floor: .ground),
        MeetingRoom(name: .diablo, floor: .ground),
        MeetingRoom(name: .portal, floor: .ground),

        MeetingRoom(name: .bubbleBobble, floor: .first),
        MeetingRoom(name: .doom, floor: .first),
        MeetingRoom(name: .fallout, floor: .first, isUseable: false),
        MeetingRoom(name: .worms, floor: .first),
        MeetingRoom(name: .halfLife, floor: .first),

        MeetingRoom(name: .wolfenstein, floor: .second),
        MeetingRoom(name: .superMario, floor: .second),
        MeetingRoom(name: .quake, floor: .second),
        MeetingRoom(name: .hastyHardy, floor: .second),
        MeetingRoom(name: .pacman, floor: .second),
        MeetingRoom(name: .warcraft, floor: .second)
    ]
}
