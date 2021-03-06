//
//  ScrollableTabBar.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-15.
//

import SwiftUI
import ViewExtractor

struct ScrollableTabBar: View {
    @Binding var index: Int
    private let leftOffset: CGFloat = 0.1

    private var tabs: [AnyView]
    private var content: [AnyView]
    private var contentHeight: CGFloat?

    init<Tabs, Content>(selection: Binding<Int>, contentHeight: CGFloat? = nil, @ViewBuilder tabs: TupleContent<Tabs>, @ViewBuilder content: TupleContent<Content>) {
        self.tabs = ViewExtractor.getViews(from: tabs)
        self.content = ViewExtractor.getViews(from: content)
        self.contentHeight = contentHeight
        self._index = selection
    }

    init<Tabs: View & DynamicViewContentProvider, Content: View & DynamicViewContentProvider>(selection: Binding<Int>, contentHeight: CGFloat? = nil, @ViewBuilder tabs: ForEachContent<Tabs>, @ViewBuilder content: ForEachContent<Content>) {
        self.tabs = ViewExtractor.getViews(from: tabs)
        self.content = ViewExtractor.getViews(from: content)
        self.contentHeight = contentHeight
        self._index = selection
    }

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tabs.indices) { idx in
                            let title = tabs[idx].id(idx)
                                .onTapGesture {
                                    withAnimation {
                                        index = idx
                                    }
                                }
                            if self.index == idx {
                                title.foregroundColor(.black)
                            } else {
                                title.foregroundColor(.gray)
                            }
                        }
                        .font(.title)
                    }
                }.onChange(of: index) { value in
                    withAnimation {
                        proxy.scrollTo(value, anchor: UnitPoint(x: UnitPoint.leading.x + leftOffset, y: UnitPoint.leading.y))
                    }
                }
            }

            if contentHeight != nil {
                TabView(selection: $index) {
                    ForEach(content.indices) { idx in
                        content[idx]
                            .id(idx)
                    }
                }
                .frame(height: contentHeight)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            } else {
                TabView(selection: $index) {
                    ForEach(content.indices) { idx in
                        content[idx]
                            .id(idx)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ScrollableTabBarItem<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .frame(maxWidth: .infinity)
        }
    }
}

extension TupleView {
    var getViews: [AnyView] {
        makeArray(from: value)
    }

    private struct GenericView {
        let body: Any

        var anyView: AnyView? {
            AnyView(_fromValue: body)
        }
    }

    private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.anyView
            }
        }

        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}

private struct Test: View {
    @State var index: Int = 0
    var body: some View {
        VStack {
            Text("seeing: \(index)")
            ScrollableTabBar(selection: $index) {
                Text("To Water")
                    .font(.custom("Mulish-Regular", size: 25))
                Text("To Mist")
                    .font(.custom("Mulish-Regular", size: 25))
                Text("To Mist2222")
                    .font(.custom("Mulish-Regular", size: 25))
                Text("To Mist44444")
                    .font(.custom("Mulish-Regular", size: 25))
            } content: {
                Text("dank")
                Text("dank2")
                Text("dank3")
                Text("dank4")
            }
            ScrollableTabBar(selection: $index) {
                ForEach(1 ... 5, id: \.self) { idx in
                    Text("\(idx)")
                }
            } content: {
                ForEach(1 ... 5, id: \.self) { idx in
                    Text("Content For: \(idx)")
                }
            }
//        content: {
//                ScrollableTabBarItem {
//                    ScrollView(.horizontal) {
//                        HStack {
//                            VStack {
//                                Text("Test1")
//                                Spacer()
//                            }
//                            .frame(width: 200, height: 200)
//                            .background(.red)
//                            VStack {
//                                Text("Test2")
//                                Spacer()
//                            }
//                            .frame(width: 200, height: 200)
//                            .background(.orange)
//                            VStack {
//                                Text("Test3")
//                                Spacer()
//                            }
//                            .frame(width: 200, height: 200)
//                            .background(.blue)
//                            VStack {
//                                Text("Test4")
//                                Spacer()
//                            }
//                            .frame(width: 200, height: 200)
//                            .background(.green)
//                        }
//                    }
//                }
//
//                ScrollableTabBarItem {
//                    HStack {
//                        Text("you need to water these!!!")
//                        Text("Like reallY")
//                        Spacer()
//                    }
//                }
//                .background(.red)
//                HStack {
//                    Text("you need to water these!!!")
//                    Text("Like reallY")
//                }
//                .frame(height: 200)
//                .background(.red)
//                HStack {
//                    Text("you need to water these!!!")
//                    Text("Like reallY")
//                }
//                .frame(height: 200)
//                .background(.red)

            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

struct ScrollableTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
