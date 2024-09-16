//
//  TestGridView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/15/24.
//

import SwiftUI

struct TestGridView: View {
    @State private var selectedItems = Set<Int>()
    @State private var dragStart: CGPoint? = nil
    @State private var dragEnd: CGPoint? = nil
    @State private var isDeselecting = false
    
    let rows = 5
    let columns = 5
    
    var body: some View {
        GeometryReader { geometry in
            let gridWidth = geometry.size.width / CGFloat(columns)
            let gridHeight = geometry.size.height / CGFloat(rows)
            
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(gridWidth), spacing: 1), count: columns), spacing: 1) {
                ForEach(0..<rows * columns, id: \.self) { index in
                    Rectangle()
                        .fill(self.selectedItems.contains(index) ? Color.red : Color.gray.opacity(0.2))
                        .frame(width: gridWidth, height: gridHeight)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if self.dragStart == nil {
                                        self.dragStart = value.startLocation
                                        self.isDeselecting = self.selectedItems.contains(index)
                                    }
                                    self.dragEnd = value.location
                                    self.updateSelection(startLocation: self.dragStart, endLocation: self.dragEnd, gridWidth: gridWidth, gridHeight: gridHeight)
                                }
                                .onEnded { _ in
                                    self.dragStart = nil
                                    self.dragEnd = nil
                                }
                        )
                }
            }
        }
    }
    
    func updateSelection(startLocation: CGPoint?, endLocation: CGPoint?, gridWidth: CGFloat, gridHeight: CGFloat) {
        guard let start = startLocation, 
                let end = endLocation else { return }
        
        let startX = min(start.x, end.x)
        let endX = max(start.x, end.x)
        let startY = min(start.y, end.y)
        let endY = max(start.y, end.y)
        
        for row in 0..<rows {
            for column in 0..<columns {
                let itemX = CGFloat(column) * gridWidth
                let itemY = CGFloat(row) * gridHeight
                let itemRect = CGRect(x: itemX, y: itemY, width: gridWidth, height: gridHeight)
                
                if itemRect.intersects(CGRect(x: startX, y: startY, width: endX - startX, height: endY - startY)) {
                    let itemIndex = row * columns + column
                    
                    // Toggle selection based on whether we are deselecting or selecting
                    if isDeselecting {
                        selectedItems.remove(itemIndex) // Deselect if it was already selected
                    } else {
                        selectedItems.insert(itemIndex) // Select if it wasn't selected
                    }
                }
            }
        }
    }
}

#Preview {
    TestGridView()
}
