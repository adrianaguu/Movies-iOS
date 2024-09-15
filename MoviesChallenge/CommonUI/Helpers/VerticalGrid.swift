//
//  VerticalGrid.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct VerticalGrid<Item, ID: Hashable, ItemView: View>: View {
    let items: [Item]
    let id: KeyPath<Item, ID>
    let columnsCount: Int?
    let itemWidth: CGFloat?
    let horizontalSpacing: CGFloat?
    let verticalSpacing: CGFloat?
    let itemView: (Item) -> ItemView
    
    init(
        items: [Item],
        id: KeyPath<Item, ID>,
        columnsCount: Int,
        horizontalSpacing: CGFloat?,
        verticalSpacing: CGFloat? = nil,
        @ViewBuilder itemView: @escaping (Item) -> ItemView
    ) {
        self.items = items
        self.id = id
        self.columnsCount = columnsCount
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.itemView = itemView
        
        itemWidth = nil
    }
    
    init(
        items: [Item],
        id: KeyPath<Item, ID>,
        itemWidth: CGFloat?,
        horizontalSpacing: CGFloat?,
        verticalSpacing: CGFloat? = nil,
        @ViewBuilder itemView: @escaping (Item) -> ItemView
    ) {
        self.items = items
        self.id = id
        self.itemWidth = itemWidth
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.itemView = itemView
        
        columnsCount = nil
    }

    var body: some View {
        if let columnsCount {
            LazyVGrid(columns: Array(repeating: gridItem(size: .flexible(), spacing: horizontalSpacing), count: columnsCount), spacing: verticalSpacing) {
                ForEach(items, id: id) {
                    itemView($0)
                }
            }
        } else if let itemWidth {
            LazyVGrid(columns: [gridItem(size: .adaptive(minimum: itemWidth), spacing: horizontalSpacing)], spacing: verticalSpacing) {
                ForEach(items, id: id) {
                    itemView($0)
                }
            }
        }
    }
    
    private func gridItem(size: GridItem.Size, spacing: CGFloat?) -> GridItem {
        var item = GridItem(size)
        item.spacing = spacing
        return item
    }
}

extension VerticalGrid where Item: Identifiable, Item.ID == ID {
    init(
        items: [Item],
        columnsCount: Int,
        horizontalSpacing: CGFloat?,
        verticalSpacing: CGFloat? = nil,
        @ViewBuilder itemView: @escaping (Item) -> ItemView
    ) {
        self.items = items
        self.id = \Item.id
        self.columnsCount = columnsCount
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.itemView = itemView
        
        itemWidth = nil
    }
}
