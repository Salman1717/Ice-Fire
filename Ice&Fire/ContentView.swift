//
//  ContentView.swift
//  Ice&Fire
//
//  Created by Salman Mhaskar on 12/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ApiHandler()
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                ForEach(viewModel.characters){ character in
                    if character.family == "House Stark"{
                        CharacterCardView(imageUrl: character.imageUrl, firstName: character.firstName, lastName: character.lastName)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Characters")
        .onAppear{
            viewModel.fetchApi()
        }
    }
}

#Preview {
    ContentView()
}
