//
//  SideMenuView.swift
//  SideMenuExample
//
//  Created by John Baker on 10/26/23.
//

import SwiftUI

struct SideMenuView: View {
    // MARK: - Environment
    @Environment(NavigationController.self) var navigationController
    
    // MARK: - Data
    
    // MARK: - Controllers
    
    // MARK: - View Properties
    
    // MARK: - Init
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("MyAppName")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("My app's tagline that's cool")
                            .font(.caption)
                            .fontWeight(.medium)
                        Text("John Baker - 2023")
                            .font(.footnote)
                            .fontWeight(.ultraLight)
                    }
                    Spacer()
                }
                
                HStack {
                    Button("Main View") {
                        withAnimation {
                            navigationController.selectedScreen = .mainScreen
                            navigationController.isShowingSidebar = false
                        }
                    }
                    .padding(.leading, navigationController.selectedScreen == .mainScreen ? 8 : 0)
                    Spacer()
                }
                .frame(height: 40)
                .background(
                    LinearGradient(gradient: Gradient(colors: navigationController.selectedScreen == .mainScreen ? [Color.purple.opacity(0.8), Color.purple.opacity(0.2)] : []), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .padding(.top, 20)
                
                HStack {
                    Button("Secondary View") {
                        withAnimation {
                            navigationController.selectedScreen = .secondaryScreen
                            navigationController.isShowingSidebar = false
                        }
                    }
                    .padding(.leading, navigationController.selectedScreen == .secondaryScreen ? 8 : 0)
                    Spacer()
                }
                .frame(height: 40)
                .background(
                    LinearGradient(gradient: Gradient(colors: navigationController.selectedScreen == .secondaryScreen ? [Color.purple.opacity(0.8), Color.purple.opacity(0.2)] : []), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                
                Spacer()
                
                ShareLink(item: URL(string: "https://google.com/")!, subject: Text("Share with Friends"), message: Text("Checkout my sweet app with an awesome side menu")) {
                    HStack(spacing: 20) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("Share with Friends")
                            .font(.callout)
                            .fontWeight(.regular)
                        Spacer()
                    }
                    .frame(maxWidth:.infinity, minHeight: 20, maxHeight: 20)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(Color.white)
                    .padding(.bottom)
                    Spacer()
                }

            }
            .foregroundStyle(Color.white)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
            .padding(.top, 40)
            
        }
    }
}

// MARK: - Previews
#Preview {
    SideMenuView()
        .environment(NavigationController())
}
