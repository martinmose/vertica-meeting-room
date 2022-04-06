// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

extension MeetingRoomService {
    struct FloorDTO: Decodable {
        let level: Int
        let meetingRooms: [MeetingRoomDTO]
    }
}

extension MeetingRoomService.FloorDTO {
    static let mockJSON =
        """
        [
            {
                "level": -1,
                "meetingRooms": [
                    {
                        "room": "lemmings",
                        "isUseable": true
                    }
                ]
            },
            {
                "level": 0,
                "meetingRooms": [
                    {
                        "room": "tekken",
                        "isUseable": true
                    },
                    {
                        "room": "spaceInvaders",
                        "isUseable": true
                    },
                    {
                        "room": "zelda",
                        "isUseable": true
                    },
                    {
                        "room": "diablo",
                        "isUseable": true
                    },
                    {
                        "room": "portal",
                        "isUseable": true
                    }
                ]
            },
            {
                "level": 1,
                "meetingRooms": [
                    {
                        "room": "bubbleBobble",
                        "isUseable": true
                    },
                    {
                        "room": "doom",
                        "isUseable": true
                    },
                    {
                        "room": "fallout",
                        "isUseable": true
                    },
                    {
                        "room": "worms",
                        "isUseable": true
                    },
                    {
                        "room": "halfLife",
                        "isUseable": true
                    }
                ]
            },
            {
                "level": 2,
                "meetingRooms": [
                    {
                        "room": "wolfenstein",
                        "isUseable": true
                    },
                    {
                        "room": "superMario",
                        "isUseable": true
                    },
                    {
                        "room": "quake",
                        "isUseable": true
                    },
                    {
                        "room": "hastyHardy",
                        "isUseable": true
                    },
                    {
                        "room": "pacman",
                        "isUseable": true
                    },
                    {
                        "room": "warcraft",
                        "isUseable": true
                    }
                ]
            }
        ]
        """
}
