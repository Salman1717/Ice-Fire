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
        ZStack{
            
            
            LinearGradient(colors: [.white,.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("Starks")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            
            
            VStack{
                Spacer()
                
                Text("House Stark")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                ScrollView(.vertical , showsIndicators: false){
                        ForEach(viewModel.characters){ character in
                            if character.family == "House Stark"{
                                ZStack{
                                    CharacterCardView(imageUrl: character.imageUrl, firstName: character.firstName, lastName: character.lastName)
                                        .scrollTransition(axis: .vertical){ content, phase in
                                            return content
                                                .scaleEffect(phase.isIdentity ? 1 : 0, anchor: .topTrailing)
                                                .opacity(phase.isIdentity ? 1 : 0)

                                                
                                                
                                            
                                        }
                                }
                                .containerRelativeFrame(.vertical)
                                                    .clipShape(RoundedRectangle(cornerRadius: 20 ))
                            }
                        }
                    }
                .scrollContentBackground(.hidden)
                    .padding()
                
                Spacer()
                
                }
                
                .navigationTitle("Characters")
                .onAppear{
                    viewModel.fetchApi()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
