//
//  ListViewApplication.swift
//  RedirectionApp
//
//  Created by Akira Santhakumaran on 4/25/24.
//

import Foundation
import SwiftUI

struct ListViewApplication: View {
    let application: Application
    @State private var isShowingAlert = false
    
    var body: some View {
        HStack {
            Image(application.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(application.name)
            
            Spacer()
            
            Button(action: {
                openApp()
            }) {
                Text(buttonText())
                    .padding(8)
                    .background(buttonBackgroundColor())
                    .foregroundColor(buttonTextColor())
                    .cornerRadius(8)
            }
            .disabled(!isAppInstalled())
        }
        .padding(.horizontal)
    }
    
    func openApp() {
        guard UIApplication.shared.canOpenURL(application.redirectURL) else {
            print("L'application n'est pas installée ou l'URL de redirection est incorrecte")
            return
        }
        
        UIApplication.shared.open(application.redirectURL)
    }
    
    func isAppInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(application.redirectURL)
    }
    
    func buttonText() -> String {
        if isAppInstalled() {
            return "Ouvrir"
        } else {
            return "Installer"
        }
    }
    
    func buttonTextColor() -> Color {
        return isAppInstalled() ? .white : .gray
    }
    
    func buttonBackgroundColor() -> Color {
        return isAppInstalled() ? .blue : .gray.opacity(0.5)
    }
}
