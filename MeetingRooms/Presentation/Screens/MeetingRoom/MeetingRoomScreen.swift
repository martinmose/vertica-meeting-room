// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

struct MeetingRoomScreen: View {
    let viewModel = ViewModel()

    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(viewModel.floors) { floor in
                Section(header: Text(floor.name)) {
                    ForEach(searchResults(meetingRooms: floor.meetingRooms)) { meetingRoom in
                        NavigationLink(destination: MeetingRoomDetailScreen(meetingRoom)) {
                            Text(meetingRoom.name.description)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationBarTitle(Text("Mødelokaler"))
    }

    private func searchResults(meetingRooms: [MeetingRoom]) -> [MeetingRoom] {
        if searchText.isEmpty {
            return meetingRooms
        } else {
            return meetingRooms.filter { $0.name.description.contains(searchText) }
        }
    }
}

struct MeetingRoomScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeetingRoomScreen()
    }
}
