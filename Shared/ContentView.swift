//
//  ContentView.swift
//  Shared
//
//  Created by Vu Nguyen Ngoc Anh on 22/09/2022.
//

import SwiftUI

/*
 Lecture 3 MVVM architecture
 Design Paradigm
 
 Swift Type System
 struct
 class
 protocol: brand new
 generic type - dont care type
 enum
 functions
 
 
 Model: Data + Logic - "The Truth"
 View
 ViewModel: Interpreter between Model and View. Notices change from Model and publishes to View
 Prcesses Intent
 
 Model -> ViewModel -> View
 View -> ViewModel -> Model
  
 
 Generic Type is Array
 
 Class is ref type
 struct is type
 */

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame;
    
    
    var emojis: Array<String> = ["😈", "👁", "💪🏾","💄", "👱🏽‍♀️", "🫁", "🧠"] // need unique identifier, to know exactly object when C.R.U.D
    @State var emojiCount = 6
    
    
    
    var body: some View {
        print("Hello Swift ",emojis);
        return
            VStack{
                Text("MemorizeApp")
                ScrollView {
                    // Be aware of array boundary
                    LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji, isFaceup : true)
                                .aspectRatio(2/3,contentMode: .fit)
                        }
                    }.background()
                    Spacer() // spacer could "eat" all the open/available space
                    HStack {
                        addButton
                        Spacer()
                        removeButton
                    }.padding(.horizontal)
                }
            }.padding(.horizontal)
        
    }
    
    var removeButton: some View {
        Button(action: { if emojiCount > 0 {
            emojiCount -= 1
        } },label: {
            VStack {
                Text("Remove")
            }
        })
    }
    
    var addButton: some View {
        Button(action: { emojiCount += 1},label: {
            VStack {
                Text("Add")
            }
        })
    }
}

struct CardView : View {
    var content: String
    @State var isFaceup: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceup {
               
                shape.frame(minHeight: 120, maxHeight:200)
                shape.fill().foregroundColor(.blue)
                Text(content).font(.largeTitle)
                    .padding()
            }else {
             
                shape.frame(minHeight: 120, maxHeight:200)
                shape.fill().foregroundColor(.red)
                Text("").font(.largeTitle)
                    .padding()
            }
           
        }.onTapGesture {
            isFaceup = !isFaceup
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let game = EmojiMemoryGame();
        ContentView(viewModel: game)
    }
}
