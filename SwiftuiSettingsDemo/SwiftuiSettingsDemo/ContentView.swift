//
//  ContentView.swift
//  SwiftuiSettingsDemo
//
//  Created by Noah Carpenter on 2024-11-05
//
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger
//

import SwiftUI

struct ContentView: View {
    // Using @AppStorage to persist user settings across app sessions
    @AppStorage("username") private var username: String = "" // Stores the username
    @AppStorage("volumeLevel") private var volumeLevel: Double = 0.5 // Stores the volume level
    @AppStorage("backgroundColor") private var backgroundColor: String = "White" // Stores the background color selection
    
    // Background color options that map strings to SwiftUI colors
    private let colorOptions: [String: Color] = ["White": .white, "Blue": .blue, "Green": .green, "Purple": .purple]
    
    init() {
        // Customizing appearance for UITableView used in Forms
        UITableView.appearance().backgroundColor = UIColor(Color.clear) // Make the UITableView background clear
    }
    
    var body: some View {
        // Navigation view for displaying the form and navigation features
        NavigationView {
            Form {
                // Section for Username input
                Section(header: Text("User Info")) {
                    // TextField to input the username, styled with rounded border
                    TextField("UserName", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5) // Add padding around the text field
                }
                
                // Section for Volume control with a slider
                Section(header: Text("Volume Slider")) {
                    HStack {
                        Text("Volume") // Label for the volume slider
                        // Slider to adjust volume between 0 and 1, showing percentage
                        Slider(value: $volumeLevel, in: 0...1, step: 0.01)
                        Text("\(Int(volumeLevel * 100))%") // Display volume as a percentage
                    }
                }
                
                // Section for changing background color
                Section(header: Text("Appearance")) {
                    // Picker for selecting a background color, segmented style
                    Picker("Background Color", selection: $backgroundColor) {
                        ForEach(colorOptions.keys.sorted(), id: \.self) { color in
                            // List each available color option as a selectable item
                            Text(color).tag(color)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()) // Apply segmented picker style
                }
            }
        }
        // Set the background color to the selected color option
        .background(colorOptions[backgroundColor] ?? .black) // Default to black if no color selected
    }
}

#Preview {
    ContentView()
}
