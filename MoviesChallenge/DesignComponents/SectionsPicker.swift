//
//  SectionsPicker.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct SectionsPicker<Section: Hashable & Titleable, SectionContent: View>: View {
    @Binding var selection: Section
    let sections: [Section]
    let sectionContent: (Section) -> SectionContent

    var body: some View {
        VStack {
            ScrollView([.horizontal], showsIndicators: false) {
                HStack {
                    ForEach(sections, id: \.hashValue) { section in
                        Button {
                            selection = section
                        } label: {
                            Text(section.title)
                                .bold()
                                .foregroundStyle(section == selection ? .white : .primary)
                                .fixedSize(horizontal: true, vertical: false)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 13)
                        }
                        .background(section == selection ? Color.accentColor : Color.clear)
                        .cornerRadius(20)
                    }
                }
            }
            .padding(.vertical)
            
            sectionContent(selection)
        }
    }
}
