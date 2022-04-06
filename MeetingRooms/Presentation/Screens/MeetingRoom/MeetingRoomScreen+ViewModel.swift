// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

extension MeetingRoomScreen {
    final class ViewModel {
        @Published var floors: [Floor] = .init()

        init() {
            Task {
                async let floors = MeetingRoomService.get()

                self.floors = try await floors.sorted { $0.level < $1.level }
            }
        }
    }
}

// extension MeetingRoomScreen {
//    struct ViewModel {
//        let floors: [Floor]
//
//        init() {
//            let grouped = Dictionary(grouping: Fake.meetingRooms) { (meetingRoom: MeetingRoom) -> String in
//                meetingRoom.floor.description
//            }
//
//            let floors = grouped.map { floors -> Floor in
//                let name = floors.key
//                let level = floors.value.first?.floor.rawValue ?? 0
//                let meetingRooms = floors.value
//                return Floor(name: name, level: level, meetingRooms: meetingRooms)
//            }.sorted { $0.level < $1.level }
//
//            self.floors = floors
//        }
//    }
// }
