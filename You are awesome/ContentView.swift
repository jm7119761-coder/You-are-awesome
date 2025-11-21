//
//  ContentView.swift
//  You are awesome
//
//  Created by MORALES, JACK on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)

        
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
              let messages = ["You are Awesome!",
                              "When the Genius Bar Needs Help, They Call You",
                             "You are Great!",
                             "You are Fantastic!",
                              "Fabulous? Thats You!",
                              "You Make Me Smile",]
                // generate a random messageNumber to use as an index
                // if messageNumber == LastMessageNumber
                // keep generating  new random messageNumber
                // until you get a messageNumber!= lastmessageNumber
                //set messageString to message [messageNumber]
                // update lastmessageNumber with messageNumber
                var messageNumber: Int
               repeat{
                    messageNumber = Int.random(in: 0...messages.count-1)
                }  while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber

                var imageNumber =  Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber =  Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
       
        .padding()
    }
}

#Preview {
    ContentView()
}
