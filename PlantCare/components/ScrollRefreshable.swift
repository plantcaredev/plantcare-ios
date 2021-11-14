//
//  ScrollRefreshable.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-13.
//

import SwiftUI

struct ScrollRefreshable<Content: View>: View {
    var content: Content
    var onRefresh: () async -> ()

    init(title: String, @ViewBuilder content: @escaping () -> Content, onRefresh: @escaping () async -> ()) {
        self.content = content()
        self.onRefresh = onRefresh
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
//        UIRefreshControl.appearance().tintColor = UIColor(color)
    }

    var body: some View {
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            await onRefresh()
        }
    }
}

struct ScrollRefreshable_Previews: PreviewProvider {
    static var previews: some View {
        ScrollRefreshable(title: "Pull to refresh") {
            LazyVStack {
                ForEach(1...20, id: \.self) { i in
                    Text("hello")
                        .frame(height: 200)
                }
            }
        } onRefresh: {
            await Task.sleep(1_000_000_000)
        }

    }
}
