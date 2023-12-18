//
//  ExtView.swift
//  ParseCSV
//
//  Created by Omay Operations on 11/17/23.
//

import SwiftUI

//https://stackoverflow.com/questions/57577462/get-width-of-a-view-using-in-swiftui

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}
