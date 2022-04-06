// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

struct MeetingRoomDetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    private let viewModel: ViewModel

    init(_ meetingRoom: MeetingRoom) {
        viewModel = ViewModel(meetingRoom: meetingRoom)
    }

    var body: some View {
        Text("Hello world")
    }

    private var customBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
}

struct MeetingRoomDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeetingRoomDetailScreen(.mock)
    }
}
