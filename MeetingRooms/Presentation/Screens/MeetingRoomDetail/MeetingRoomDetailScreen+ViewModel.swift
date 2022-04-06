// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

extension MeetingRoomDetailScreen {
    struct ViewModel {
        let imageName: String
        let name: String
        let floor: String
        let isUseable: Bool

        init(meetingRoom: MeetingRoom) {
            imageName = meetingRoom.name.imageName
            name = meetingRoom.name.description
            floor = meetingRoom.floor.description
            isUseable = meetingRoom.isUseable
        }
    }
}
