//
//  BetterHostingController.swift.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 23.01.2026.
//

import Foundation
import SwiftUI

final class BetterHostingController <Content>: UIHostingController<AnyView> where Content : View {

    public init(shouldShowNavigationBar: Bool = false, rootView: Content) {
        super.init(rootView: AnyView(
            rootView
                .navigationBarHidden(!shouldShowNavigationBar)
        ))
    }

    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
