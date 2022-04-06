// Copyright © 2022 Vertica A/S. All rights reserved.

import SwiftUI

@main
struct MeetingRoomsApp: App {
    @State private var showingSheet = false

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MeetingRoomScreen()
                    .navigationBarItems(trailing:
                        HStack {
                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                Image(systemName: "info")
                            }
                            .sheet(isPresented: $showingSheet) {
                                MeetingRoomsImageView()
                            }.padding()
                        })
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
