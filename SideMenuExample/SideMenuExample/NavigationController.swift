//
//  NavigationController.swift
//  SideMenuExample
//
//  Created by John Baker on 10/26/23.
//

import SwiftUI

@Observable
class NavigationController {
    var isShowingSidebar: Bool = false
    
    var selectedScreen: Screens = .mainScreen
}

enum Screens {
    case mainScreen
    case secondaryScreen
}
