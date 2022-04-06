// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

struct MeetingRoomsImageView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Image("meeting-rooms")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .pinchToZoom()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        dismiss()

                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}
