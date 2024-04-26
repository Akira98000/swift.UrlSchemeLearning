//
//  ContentView.swift
//  RedirectionApp
//
//  Created by Akira Santhakumaran on 4/25/24.
//

import SwiftUI
import UserNotifications


struct ContentView: View {
    
    @State private var userName = ""
    let notificationIdentifier = "MonNotificationIdentifier"

    
    let applications: [Application] = [
        Application(name: "Message iOS", imageName: "message", redirectURL: URL(string: "sms:")!),
        Application(name: "Messenger", imageName: "messenger", redirectURL: URL(string: "http://m.me/")!),
        Application(name: "WhatsApp", imageName: "whatsapp", redirectURL: URL(string: "https://wa.me/")!),
    ]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Voici les raccourcis des applications")
                    .padding(.leading)
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(applications, id: \.name) { app in
                            ListViewApplication(application: app)
                        }
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    Text("Si l'application est installer, il va vous afficher 'ouvrir', sinon il va vous afficher 'installer'")
                        .padding()
                    VStack(spacing: 20) {
                        Button(action: {
                            triggerInstantNotification()
                        }) {
                            Text("Déclencher une notification")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            }.padding()
                    }.padding()
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Bienvenue \(userName)")
        }
        .onAppear {
            requestNotificationAuthorization()
            if userName.isEmpty {
                askForUserName()
            }
        }
    }
    
    func requestNotificationAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Autorisations de notification accordées")
                } else {
                    print("Autorisations de notification refusées")
                }
            }
        }
        
    
    func triggerInstantNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Notification instantanée"
            content.body = "Cette notification a été déclenchée instantanément."
            content.sound = UNNotificationSound.default
            
            // Crée le déclencheur pour la notification (instantanée)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
            
            // Crée une demande de notification
            let request = UNNotificationRequest(identifier: notificationIdentifier, content: content, trigger: trigger)
            
            // Ajoute la demande de notification au centre de notification
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Erreur lors de l'ajout de la notification instantanée: \(error.localizedDescription)")
                } else {
                    print("Notification instantanée ajoutée avec succès.")
                }
            }
    }
    
    func askForUserName(){
        userName = "Akira"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

