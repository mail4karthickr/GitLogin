//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 02/03/22.
//

import SwiftUI
import SwiftUINavigation

public struct TransitionView<Value, WrappedContent: View>: ViewModifier {
    private let edge: Edge
    private let optionalValue: Binding<Value?>
    private let wrappedContent: (Binding<Value>) -> WrappedContent
    
    public init(
        edge: Edge,
        unwrap optionalValue: Binding<Value?>,
        @ViewBuilder wrappedContent: @escaping (Binding<Value>) -> WrappedContent
    ) {
        self.edge = edge
        self.optionalValue = optionalValue
        self.wrappedContent = wrappedContent
    }

    public func body(content: Content) -> some View {
         ZStack {
             content
             if self.optionalValue.isPresent().wrappedValue {
                 Binding(unwrapping: optionalValue)
                     .map(wrappedContent)?
                     .zIndex(1)
                     .transition(.move(edge: edge))
             }
         }
         .animation(.linear, value: self.optionalValue.isPresent().wrappedValue)
    }
}

extension View {
    public func viewTransition<Value, Content>(
        edge: Edge,
        unwrap optionalValue: Binding<Value?>,
        @ViewBuilder content: @escaping (Binding<Value>) -> Content
    ) -> some View where Content: View {
        modifier(
            TransitionView(
                edge: edge,
                unwrap: optionalValue,
                wrappedContent: content
            )
        )
    }

    public func viewTransition<Enum, Case, Content>(
        edge: Edge,
        unwrap optionalValue: Binding<Enum?>,
        case casePath: CasePath<Enum, Case>,
        @ViewBuilder content: @escaping (Binding<Case>) -> Content
    ) -> some View where Content: View {
        modifier(
            TransitionView(
                edge: edge,
                unwrap: optionalValue.case(casePath),
                wrappedContent: content
            )
        )
    }
}

